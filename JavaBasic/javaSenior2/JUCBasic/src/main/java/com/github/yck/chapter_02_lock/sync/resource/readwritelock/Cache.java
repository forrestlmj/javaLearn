package com.github.yck.chapter_02_lock.sync.resource.readwritelock;

public interface Cache {
    void put(String k,String v);
    String get(String k);
}
