package com.github.yck.chapter_02_lock.sync.resource.lock;

import com.github.yck.chapter_02_lock.sync.resource.Tickets;

import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/**
 * 测试 Condition 的 await 与 signal 方法。
 *
 * @see ConditionAwaitSignal 的更直接版本
 *
 * 两个 condition 在while中代表不同的状态。
 * 放在 while 中，其实是说 condition 需要 await 时候，while中的判断应该是不符合
 * conditon的
 */
public class ConditionAwaitSignal2 implements Tickets {
    private Integer number = 10000;
    private Lock lock = new ReentrantLock();
    private Condition even = lock.newCondition();
    private Condition odd = lock.newCondition();

    /**
     * 只卖偶数号的票
     * @return
     */
    public boolean saleEven(){
        boolean returnFlag = false;
        try {
            lock.lock();
            // 类似于唤醒机制
            while ((number%2 != 0) && number>0){
                even.await();
            }

            if (number > 0){
                number --;
                System.out.println(Thread.currentThread().getName()
                        +"卖出 1 张票，还剩下: "+number);

                returnFlag = true;

            }else returnFlag = false;
            //
            odd.signalAll();

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
                odd.await();
            }

            if (number > 0){
                number --;
                System.out.println(Thread.currentThread().getName()
                        +"卖出 1 张票，还剩下: "+number);
                returnFlag = true;
            }else returnFlag = false;
            //
            even.signalAll();

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
