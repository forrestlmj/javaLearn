package com.github.yck.chapter_02_03_04_08.lock;

import com.github.yck.chapter_02_03_04_08.TicketTestBase;
import com.github.yck.chapter_02_03_04_08.sync.SyncCodeTicketsImpl;
import com.github.yck.chapter_02_03_04_08.sync.SyncTicketsImpl;
import com.github.yck.chapter_02_03_04_08.sync.UnsafeTicketsImpl;
import com.github.yck.chapter_02_03_04_08.sync.VolatileTicketsImpl;

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
