package com.github.yck.chapter_02_03_04.deadlock;

import com.github.yck.chapter_02_03_04.Tickets;

import java.util.concurrent.TimeUnit;

/**
 * 死锁：两个线程互相持有对方需要的锁。
 *
 */
public class SyncDeadLock implements Tickets {
    Object lock1 = new Object();
    Object lock2 = new Object();
    @Override
    public boolean sale() {
        return false;
    }

    @Override
    public boolean saleOdd() {
        synchronized (lock1){
            System.out.println(Thread.currentThread().getName()
            +" 持有 lock1 锁");
            try {
                TimeUnit.SECONDS.sleep(1);
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
            synchronized (lock2){
                System.out.println(Thread.currentThread().getName()
                        +" 持有 lock2 锁");            }
        }
        return true;
    }

    @Override
    public boolean saleEven() {
        synchronized (lock2){
            System.out.println(Thread.currentThread().getName()
                    +" 持有 lock2 锁");
            try {
                TimeUnit.SECONDS.sleep(1);
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
            synchronized (lock1){
                System.out.println(Thread.currentThread().getName()
                        +" 持有 lock1 锁");            }
        }
        return true;    }
}
