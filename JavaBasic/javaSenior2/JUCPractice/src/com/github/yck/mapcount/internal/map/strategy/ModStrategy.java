package com.github.yck.mapcount.internal.map.strategy;


import com.github.yck.mapcount.internal.map.memorytable.TableID;

public interface ModStrategy {
    TableID mod(String content);
}
