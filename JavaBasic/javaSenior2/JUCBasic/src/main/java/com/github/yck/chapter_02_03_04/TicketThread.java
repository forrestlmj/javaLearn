package com.github.yck.chapter_02_03_04;

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
