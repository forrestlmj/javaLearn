package com.github.yck.chapter_02_03_04.lock;

import com.github.yck.chapter_02_03_04.Tickets;

import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public class LockTicketsImpl implements Tickets {
    private Integer number = 1000;
    private Lock lock = new ReentrantLock();
    @Override
    public boolean sale() {
        boolean flag = false;
        try {
            lock.lock();
//            Thread.sleep(2);
            if (number>0){
                System.out.println(Thread.currentThread().getName()
                +" 卖出一张票,剩余： "+number);
                number--;
                flag = true;
            }else flag = false;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }finally {
            lock.unlock();
            return flag;
        }

    }
}
