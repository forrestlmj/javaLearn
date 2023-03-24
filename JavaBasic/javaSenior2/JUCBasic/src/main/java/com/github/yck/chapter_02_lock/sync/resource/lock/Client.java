package com.github.yck.chapter_02_lock.sync.resource.lock;

import com.github.yck.chapter_02_lock.sync.resource.TicketTestBase;
import com.github.yck.chapter_02_lock.sync.resource.sync.SyncCodeTicketsImpl;
import com.github.yck.chapter_02_lock.sync.resource.sync.SyncTicketsImpl;
import com.github.yck.chapter_02_lock.sync.resource.sync.UnsafeTicketsImpl;
import com.github.yck.chapter_02_lock.sync.resource.sync.VolatileTicketsImpl;

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
