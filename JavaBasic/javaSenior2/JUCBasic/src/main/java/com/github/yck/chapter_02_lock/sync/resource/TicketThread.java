package com.github.yck.chapter_02_lock.sync.resource;

import com.github.yck.chapter_02_lock.sync.resource.Tickets;

public class TicketThread implements Runnable {

    public TicketThread(Tickets tickets) {
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
