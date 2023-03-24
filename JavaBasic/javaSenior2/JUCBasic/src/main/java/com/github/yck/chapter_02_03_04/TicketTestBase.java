package com.github.yck.chapter_02_03_04;

abstract public class TicketTestBase {
    /**
     * 三个线程调用同一方法
     */
    public static void test3ThreadOf1Method(Tickets tickets){
        Thread aa = new Thread(new TicketThread(tickets), "AA");
        Thread bb = new Thread(new TicketThread(tickets), "BB");
        Thread cc = new Thread(new TicketThread(tickets), "CC");
        aa.start();bb.start();cc.start();

    }
    public static void testSyncDeadLock(Tickets SyncDeadLock) {
        new Thread(new Runnable() {
            @Override
            public void run() {
                while (true){
                    if (!SyncDeadLock.saleOdd())break;
                }
            }
        },"AA").start();

        new Thread(new Runnable() {
            @Override
            public void run() {
                while (true){
                    if (!SyncDeadLock.saleEven())break;
                }
            }
        },"BB").start();
    }

    public static void test3ThreadOf3Method(Tickets t) {
        new Thread(
                new Runnable() {
                    @Override
                    public void run() {
                        while (true) {
                            if (!t.sale()) break;
                        }
                    }
                },"sale-Thread"
        ).start();

        new Thread(
                new Runnable() {
                    @Override
                    public void run() {
                        while (true) {
                            if (!t.saleEven()) break;
                        }
                    }
                },"saleEven-Thread"
        ).start();

        new Thread(
                new Runnable() {
                    @Override
                    public void run() {
                        while (true) {
                            if (!t.saleOdd()) break;
                        }
                    }
                },"saleOdd-Thread"
        ).start();
    }


    public static void test2ThreadOf2Method(Tickets l) {
        new Thread(
                new Runnable() {
                    @Override
                    public void run() {
                        while (true){
                            if (!l.saleEven())break;
                        }
                    }
                },"Even"
        ).start();

        new Thread(
                new Runnable() {
                    @Override
                    public void run() {
                        while (true){
                            if (!l.saleOdd())break;
                        }
                    }
                },"ODD"
        ).start();
    }
}
