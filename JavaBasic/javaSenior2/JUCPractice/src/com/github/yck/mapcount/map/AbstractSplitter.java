package com.github.yck.mapcount.map;


import com.github.yck.mapcount.map.ck.CheckPoint;
import com.github.yck.mapcount.map.lsm.FlushTableName;
import com.github.yck.mapcount.map.lsm.MemoryTable;
import com.github.yck.mapcount.map.lsm.SimpleMemoryTable;
import com.github.yck.mapcount.map.strategy.Strategy;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AbstractSplitter implements Splitter {
    private Map<FlushTableName, MemoryTable> memoryTableMap = new HashMap<>();

    @Override
    public Splitter setTempWorkSpace(String path) {
        return null;
    }

    public AbstractSplitter(Strategy strategy, CheckPoint checkPoint) {
        this.strategy = strategy;
        this.checkPoint = checkPoint;
    }

    private Strategy strategy;
    private CheckPoint checkPoint;
    @Override
    @Deprecated
    public void splitToFile(List<String> content) {
        for (String s : content) {
            writeToMemory(s);
        }
        //到达CheckPointSecond时，需要设计定时任务

//        if(checkPoint.isCallCheckPoint()){
//            checkpoint();
//        }
    }

    @Override
    public void split(String content) {
        if (checkPoint.needToCheckPoint()){
            checkpoint();
        }else{
            writeToMemory(content);
            checkPoint.updateCheckPoint();
        }
    }

//    @Override
    public void writeToMemory(String s) {
        FlushTableName flushTableName = strategy.mod(s);
        // TODO 写入文件

//        memoryTableMap.getOrDefault(flushTableName,new SimpleMemoryTable(flushTableName)).add(s);
        if (memoryTableMap.containsKey(flushTableName)){
            memoryTableMap.get(flushTableName).add(s);
        }else {
            memoryTableMap.put(flushTableName,new SimpleMemoryTable(flushTableName,s));

        }
    }

    /**
     * 1.将 memoryTableMap 刷写到硬盘中
     * 2.当全部刷写完成时候，将 memoryTableMap 回收。
     */
    @Override
    public void checkpoint() {
        System.out.println("开始CK");
        for (MemoryTable m : memoryTableMap.values()) {
            checkPoint.flushMemoryTable(m);
        }
        checkPoint.resetCheckPoint();
        System.out.println("结束CK");

    }
}
