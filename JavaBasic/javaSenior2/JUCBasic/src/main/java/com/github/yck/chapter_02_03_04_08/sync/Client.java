package com.github.yck.chapter_02_03_04_08.sync;

import com.github.yck.chapter_02_03_04_08.TicketTestBase;

/**
 * @see SyncCodeTicketsImpl
 * @see SyncTicketsImpl
 * @see UnsafeTicketsImpl
 * @see VolatileTicketsImpl
 * @see
 */
public class Client extends TicketTestBase {
    public static void main(String[] args) {
        test3ThreadOf1Method(new SyncCodeTicketsImpl());
//        test3ThreadOf1Method(new SyncTicketsImpl());
//        test3ThreadOf1Method(new UnsafeTicketsImpl());
//        test3ThreadOf1Method(new VolatileTicketsImpl());
//        test3ThreadOf1Method(new WaitNotifyTicketsImpl());

    }










}
