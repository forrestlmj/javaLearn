package com.github.yck.chapter_02_lock.sync.resource.sync;

import com.github.yck.chapter_02_lock.sync.resource.Tickets;

/**
 * 使用Sync修饰方法，绝对保险
 */
public class SyncTicketsImpl implements Tickets {
    private int ticketNum = 100;
    @Override
    public synchronized boolean sale() {
        if (ticketNum>0){
            ticketNum--;
            try {
                Thread.sleep(100);
            } catch (InterruptedException e) {
//                throw new RuntimeException(e);
            }
            System.out.println(Thread.currentThread().getName()
                    +"卖出一张，剩余"+ticketNum);
            return true;
        }else {
            return false;
        }
    }
}
