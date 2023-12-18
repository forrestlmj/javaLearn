package com.github.yck.topN.internal.map.strategy;


import com.github.yck.topN.internal.map.memorytable.TableID;

public interface ModStrategy {
    TableID mod(String content);
}
