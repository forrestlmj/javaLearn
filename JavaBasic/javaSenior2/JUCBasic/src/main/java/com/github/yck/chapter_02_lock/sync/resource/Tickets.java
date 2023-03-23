package com.github.yck.chapter_02_lock.sync.resource;

public interface Tickets {
    boolean sale();
    default boolean saleOdd(){return false;}
    default boolean saleEven(){return false;}
}
