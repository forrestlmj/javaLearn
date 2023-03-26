package com.github.yck.chapter_02_03_04_08.readwritelock;

public interface Cache {
    void put(String k,String v);
    String get(String k);
}
