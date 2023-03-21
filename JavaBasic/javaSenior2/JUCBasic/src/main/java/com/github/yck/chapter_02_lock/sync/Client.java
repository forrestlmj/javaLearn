package com.github.yck.chapter_02_lock.sync;

import com.github.yck.chapter_02_lock.sync.resource.*;
import org.junit.jupiter.api.Test;

/**
 * @see SyncCodeTicketsImpl
 * @see SyncTicketsImpl
 * @see UnsafeTicketsImpl
 * @see VolatileTicketsImpl
 * @see
 */
public class Client {
    public static void main(String[] args) {
//        testMyThread(new SyncCodeTicketsImpl());
//        testMyThread(new SyncTicketsImpl());
        testMyThread(new UnsafeTicketsImpl());
//        testMyThread(new VolatileTicketsImpl());
    }

    /**
     * @see SyncTicketsImpl
     */
    public static void testMyThread(Tickets tickets){
        Thread aa = new Thread(new MyThread(tickets), "AA");
        Thread bb = new Thread(new MyThread(tickets), "BB");
        Thread cc = new Thread(new MyThread(tickets), "CC");
        aa.start();bb.start();cc.start();

    }




}
