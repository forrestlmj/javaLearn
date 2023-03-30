package com.github.yck.mapcount.map.strategy;


import com.github.yck.mapcount.map.lsm.TableID;

public interface ModStrategy {
    TableID mod(String content);
}
