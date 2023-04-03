package com.github.yck.mapcount.map;


import com.github.yck.mapcount.map.ck.CheckPoint;
import com.github.yck.mapcount.map.disktable.DiskTable;
import com.github.yck.mapcount.map.disktable.FlyWeightDiskTable;
import com.github.yck.mapcount.map.lsm.TableID;
import com.github.yck.mapcount.map.lsm.MemoryTable;
import com.github.yck.mapcount.map.lsm.SimpleMemoryTable;
import com.github.yck.mapcount.map.strategy.ModStrategy;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

public class AbstractSplitter implements Splitter {
    private Map<TableID, MemoryTable> memoryTableMap = new HashMap<>();
    private Map<TableID, DiskTable> diskTableHashMap = new WeakHashMap<>();

    @Override
    public Splitter setTempWorkSpace(String path) {
        return null;
    }

    public AbstractSplitter(ModStrategy modStrategy, CheckPoint checkPoint) {
        this.modStrategy = modStrategy;
        this.checkPoint = checkPoint;
    }

    private ModStrategy modStrategy;
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
        TableID tableID = modStrategy.mod(s);
        // TODO 写入文件

//        memoryTableMap.getOrDefault(flushTableName,new SimpleMemoryTable(flushTableName)).add(s);
        if (memoryTableMap.containsKey(tableID)){
            memoryTableMap.get(tableID).add(s);
        }else {
            memoryTableMap.put(tableID,new SimpleMemoryTable(tableID,s));

        }
    }

    /**
     * 1.将 memoryTableMap 刷写到硬盘中
     * 2.当全部刷写完成时候，将 memoryTableMap 回收。
     */
    @Override
    public void checkpoint() {
        System.out.println("开始CK");
        for (TableID tableID : memoryTableMap.keySet()) {
            checkPoint.flushMemoryTable(memoryTableMap.get(tableID),
                    diskTableHashMap.getOrDefault(
                            tableID,new FlyWeightDiskTable(tableID)));
        }

        checkPoint.resetCheckPoint();
        System.out.println("结束CK");

    }
}
