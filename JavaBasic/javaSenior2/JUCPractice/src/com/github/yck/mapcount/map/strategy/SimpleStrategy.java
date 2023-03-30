package com.github.yck.mapcount.map.strategy;


import com.github.yck.mapcount.map.lsm.FlushTableName;

public class SimpleStrategy implements Strategy {
    private Integer MOD;

    public SimpleStrategy(Integer MOD) {
        this.MOD = MOD;
    }



    @Override
    public FlushTableName mod(String content) {
        return new FlushTableName(String.valueOf(content.hashCode()%MOD));
    }
}
