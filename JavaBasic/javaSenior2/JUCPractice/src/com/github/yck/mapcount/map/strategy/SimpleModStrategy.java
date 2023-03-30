package com.github.yck.mapcount.map.strategy;


import com.github.yck.mapcount.map.lsm.TableID;

public class SimpleModStrategy implements ModStrategy {
    private Integer MOD;

    public SimpleModStrategy(Integer MOD) {
        this.MOD = MOD;
    }



    @Override
    public TableID mod(String content) {
        return new TableID(String.valueOf(content.hashCode()%MOD));
    }
}
