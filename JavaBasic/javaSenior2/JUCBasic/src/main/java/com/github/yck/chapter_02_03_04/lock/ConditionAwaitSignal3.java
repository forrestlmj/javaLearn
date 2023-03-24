package com.github.yck.chapter_02_03_04.lock;

import com.github.yck.chapter_02_03_04.Tickets;

import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/**
 * 演示三个condition，互相通信。
 * 方法功能：
 *  sale - 一次只卖1张票。卖出（或没票）之后，signal->saleOdd
 *  saleOdd - 一次只卖3张票。卖出（或没票）之后，signal->saleEven
 *  saleEven - 一次只卖4张票。卖出（或没票）之后，signal->sale,
 *
 * 在 lock 中，通过对 flag 当前值的判断，决定唤醒哪个线程，
 * 当该线程完成作业后，修改 flag，唤醒对应的线程。
 */
enum FLAG{
    SALE,SALE_ODD,SALE_EVEN
}
public class ConditionAwaitSignal3 implements Tickets {
    private Integer tickets = 100;

    private FLAG flag = FLAG.SALE;
    private Lock lock = new ReentrantLock();
    private Condition saleCondition = lock.newCondition();
    private Condition saleOddCondition = lock.newCondition();
    private Condition saleEvenCondition = lock.newCondition();

    @Override
    public boolean sale() {
        boolean returnFlag = true;
        Integer time = 1;
        // 第一步：上锁
        lock.lock();
        try {
            // 第二步：根据 判断位 判断是否需要唤醒该作业
            while (!flag.equals(FLAG.SALE)){
                saleCondition.await();
            }
            // 第三步：根据业务，判断线程是否要终止（还有没有票）
            if (tickets>0){
                for (int i = 0; i < time; i++) {
                    tickets--;
                }
                System.out.println(Thread.currentThread().getName()
                        +"通过sale方法，卖出" + time + "张票，剩余："+tickets);
            }else returnFlag = false;
            // 第四步
            flag = FLAG.SALE_ODD;
            saleOddCondition.signal();

        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        } finally {
            lock.unlock();
        }
        return returnFlag;
    }

    @Override
    public boolean saleOdd() {
        boolean returnFlag = true;
        Integer time = 3;
        // 第一步：上锁
        lock.lock();
        try {
            // 第二步：根据 判断位 判断是否需要唤醒该作业
            while (!flag.equals(FLAG.SALE_ODD)){
                saleOddCondition.await();
            }
            // 第三步：根据业务，判断线程是否要终止（还有没有票）
            if (tickets>0){
                for (int i = 0; i < time; i++) {
                    tickets--;
                }
                System.out.println(Thread.currentThread().getName()
                        +"通过saleOdd方法，卖出" + time + "张票，剩余："+tickets);
            }else returnFlag = false;
            // 第四步
            flag = FLAG.SALE_EVEN;
            saleEvenCondition.signal();

        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        } finally {
            lock.unlock();
        }

        return returnFlag;
    }

    @Override
    public boolean saleEven() {
        boolean returnFlag = true;
        Integer time = 4;
        // 第一步：上锁
        lock.lock();
        try {
            // 第二步：根据 判断位 判断是否需要唤醒该作业
            while (!flag.equals(FLAG.SALE_EVEN)){
                saleEvenCondition.await();
            }
            // 第三步：根据业务，判断线程是否要终止（还有没有票）
            if (tickets>0){
                for (int i = 0; i < time; i++) {
                    tickets--;
                }
                System.out.println(Thread.currentThread().getName()
                        +"通过saleEven方法，卖出" + time + "张票，剩余："+tickets);
            }else returnFlag = false;
            // 第四步
            flag = FLAG.SALE;
            saleCondition.signal();

        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        } finally {
            lock.unlock();
        }
        return returnFlag;
    }
}
