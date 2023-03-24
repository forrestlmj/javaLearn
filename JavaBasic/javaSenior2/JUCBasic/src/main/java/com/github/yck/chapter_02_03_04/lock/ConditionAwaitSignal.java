package com.github.yck.chapter_02_03_04.lock;

import com.github.yck.chapter_02_03_04.Tickets;

import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/**
 * 测试 Condition 的 await 与 signal 方法。
 *
 * 两个方法持有一个锁，通过一个 condition 进行通信。
 * 将 condition 是否要进入 await 的判断放在 while 中，因此它叫做可重入锁。
 */
public class ConditionAwaitSignal implements Tickets {
    private Integer number = 100;
    private Lock lock = new ReentrantLock();
    private Condition condition = lock.newCondition();

    /**
     * 只卖偶数号的票
     * @return
     */
    public boolean saleEven(){
        boolean returnFlag = false;
        try {
            lock.lock();
            // 类似于唤醒机制
            while (number%2 != 0 && number>0){
                condition.await();
            }

            if (number > 0){
                number --;
                System.out.println(Thread.currentThread().getName()
                        +"卖出 1 张票，还剩下: "+number);

                returnFlag = true;

            }else returnFlag = false;
            //
            condition.signalAll();

        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        } finally {

            lock.unlock();
        }
        return returnFlag;
    }

    /**
     * 只卖奇数号的票
     * @return
     */
    public boolean saleOdd(){
        boolean returnFlag = false;
        try {
            lock.lock();
            // 类似于唤醒机制
            while (number%2 == 0 && number > 0){
                condition.await();
            }

            if (number > 0){
                number --;
                System.out.println(Thread.currentThread().getName()
                        +"卖出 1 张票，还剩下: "+number);
                returnFlag = true;
            }else returnFlag = false;
            //
            condition.signalAll();

        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        } finally {

            lock.unlock();
        }
        return returnFlag;
    }
    @Override
    public boolean sale() {
        return false;
    }
}
