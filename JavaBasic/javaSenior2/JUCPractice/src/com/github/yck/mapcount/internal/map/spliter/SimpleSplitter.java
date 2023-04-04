package com.github.yck.mapcount.internal.map.spliter;


import com.github.yck.mapcount.internal.map.ck.CheckPoint;
import com.github.yck.mapcount.internal.map.disktable.DiskTable;
import com.github.yck.mapcount.internal.map.strategy.ModStrategy;
import com.github.yck.mapcount.internal.map.memorytable.TableID;
import com.github.yck.mapcount.internal.map.memorytable.MemoryTable;
import com.github.yck.mapcount.internal.map.memorytable.SimpleMemoryTable;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SimpleSplitter implements Splitter {
    private Map<TableID, MemoryTable> memoryTableMap = new HashMap<>();
    private DiskTable diskTable;

    public SimpleSplitter(ModStrategy modStrategy, CheckPoint checkPoint, DiskTable d) {
        this.modStrategy = modStrategy;
        this.checkPoint = checkPoint;
        this.diskTable = d;
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
                    diskTable);
        }

        checkPoint.resetCheckPoint();
        System.out.println("结束CK");

    }
}
