package com.github.yck.mapcount.map.strategy;


import com.github.yck.mapcount.map.lsm.FlushTableName;

public interface Strategy {
    FlushTableName mod(String content);
}
