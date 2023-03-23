package com.github.yck.chapter_02_lock.sync;

import com.github.yck.chapter_02_lock.sync.resource.*;
import com.github.yck.chapter_02_lock.sync.resource.lock.ConditionAwaitSignal;
import com.github.yck.chapter_02_lock.sync.resource.lock.ConditionAwaitSignal2;
import com.github.yck.chapter_02_lock.sync.resource.sync.*;

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
//        testMyThread(new UnsafeTicketsImpl());
//        testMyThread(new VolatileTicketsImpl());
//        testMyThread(new WaitNotifyTicketsImpl());
//        testMyThread(new LockTicketsImpl());
//        testLockTicketsAwaitSignal(new ConditionAwaitSignal());
        testLockTicketsAwaitSignal(new ConditionAwaitSignal2());
    }



    private static void testLockTicketsAwaitSignal(Tickets l) {
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
