package com.github.yck.chapter_02_03_04.lock;

import com.github.yck.chapter_02_03_04.TicketTestBase;
import com.github.yck.chapter_02_03_04.sync.SyncCodeTicketsImpl;
import com.github.yck.chapter_02_03_04.sync.SyncTicketsImpl;
import com.github.yck.chapter_02_03_04.sync.UnsafeTicketsImpl;
import com.github.yck.chapter_02_03_04.sync.VolatileTicketsImpl;

/**
 * @see SyncCodeTicketsImpl
 * @see SyncTicketsImpl
 * @see UnsafeTicketsImpl
 * @see VolatileTicketsImpl
 * @see
 */
public class Client extends TicketTestBase {
    public static void main(String[] args) {

        test3ThreadOf1Method(new LockTicketsImpl());
        test2ThreadOf2Method(new ConditionAwaitSignal());
        test2ThreadOf2Method(new ConditionAwaitSignal2());
        test3ThreadOf3Method(new ConditionAwaitSignal3());
    }








}
