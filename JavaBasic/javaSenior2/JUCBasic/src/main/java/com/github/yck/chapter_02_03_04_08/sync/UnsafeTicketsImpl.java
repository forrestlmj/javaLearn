package com.github.yck.chapter_02_03_04_08.sync;

import com.github.yck.chapter_02_03_04_08.Tickets;

/**
 * 平平无奇的一个变量。
 */
public class UnsafeTicketsImpl implements Tickets {


    private int ticketNum = 100;
    @Override
    public boolean sale() {
        if (ticketNum>0){
            ticketNum--;
            try {
                Thread.sleep(100);
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }

            System.out.println(Thread.currentThread().getName()
                    +"卖出一张，剩余"+ticketNum);
            return true;
        }else {
            return false;
        }
    }
}
