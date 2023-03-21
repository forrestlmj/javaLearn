package com.github.yck.chapter_02_lock.sync;

import com.github.yck.chapter_02_lock.sync.resource.Tickets;

public class MyThread implements Runnable {

    public MyThread(Tickets tickets) {
        this.tickets = tickets;

    }

    private Tickets tickets;

    @Override
    public void run() {
        while (true){
            if (!tickets.sale()) {

                break;
            }
        }

    }
}
