package com.github.yck.chapter_02_03_04_08;

public interface Tickets {
    boolean sale();
    default boolean saleOdd(){return false;}
    default boolean saleEven(){return false;}
}
