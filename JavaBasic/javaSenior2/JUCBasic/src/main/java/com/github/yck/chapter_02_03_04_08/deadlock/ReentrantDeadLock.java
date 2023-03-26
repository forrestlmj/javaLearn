package com.github.yck.chapter_02_03_04_08.deadlock;

import com.github.yck.chapter_02_03_04_08.Tickets;

import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/**
 * 查看日志：ReentrantDeadLock.log
 *
 */
public class ReentrantDeadLock implements Tickets {
    private Lock lockEven = new ReentrantLock();
    private Lock lockOdd = new ReentrantLock();
    @Override
    public boolean sale() {
        return false;
    }

    @Override
    public boolean saleOdd() {
        lockEven.lock();
        try {
            System.out.println(Thread.currentThread().getName()
            +":获得LockEven");
            lockOdd.lock();
            try {
                System.out.println(Thread.currentThread().getName()
                        +":获得LockOdd");
            }finally {
                lockOdd.unlock();
            }
        }finally {
            lockEven.unlock();
        }
        return true;
    }

    @Override
    public boolean saleEven() {
        lockOdd.lock();
        try {
            System.out.println(Thread.currentThread().getName()
                    +":获得LockEven");
            lockEven.lock();
            try {
                System.out.println(Thread.currentThread().getName()
                        +":获得LockOdd");
            }finally {
                lockEven.unlock();
            }
        }finally {
            lockOdd.unlock();
        }
        return true;
    }
}
