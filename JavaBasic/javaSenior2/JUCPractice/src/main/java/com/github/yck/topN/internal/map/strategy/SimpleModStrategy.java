package com.github.yck.topN.internal.map.strategy;


import com.github.yck.topN.internal.map.memorytable.TableID;

public class SimpleModStrategy implements ModStrategy {
    private Integer MOD;

    public SimpleModStrategy(Integer MOD) {
        this.MOD = MOD;
    }


    /**
     * TODO 应该会产生大量的TableID，这里要用享元模式，或 String 。
     * @param content
     * @return
     */
    @Override
    public TableID mod(String content) {

        return new TableID(String.valueOf(
                // 注意 hashcode 的正负问题
                content.hashCode() >= 0?content.hashCode() % MOD:-content.hashCode() % MOD
        ));
    }
}
