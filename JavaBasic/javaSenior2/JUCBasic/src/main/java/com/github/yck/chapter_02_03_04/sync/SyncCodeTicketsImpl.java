package com.github.yck.chapter_02_03_04.sync;

import com.github.yck.chapter_02_03_04.Tickets;

/**
 * 使用Sync修饰If前面，保证线程安全
 */
public class SyncCodeTicketsImpl implements Tickets {
    private Integer ticketNum = 100;
    @Override
    public  boolean sale() {
        // 监视器不要搞错了，是类.class
        synchronized(SyncCodeTicketsImpl.class){
            if (ticketNum>0){
                ticketNum--;
                System.out.println(Thread.currentThread().getName()
                        +"卖出一张，剩余"+ticketNum);
                return true;
            }else {
                return false;
            }
        }

    }
}
