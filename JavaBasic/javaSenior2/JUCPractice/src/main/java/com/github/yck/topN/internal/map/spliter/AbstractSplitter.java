package com.github.yck.topN.internal.map.spliter;

import com.github.yck.topN.internal.map.ck.CheckPoint;
import com.github.yck.topN.internal.map.disktable.DiskTable;
import com.github.yck.topN.internal.map.memorytable.MemoryTable;
import com.github.yck.topN.internal.map.memorytable.TableID;
import com.github.yck.topN.internal.map.strategy.ModStrategy;

import java.util.HashMap;
import java.util.Map;

public class AbstractSplitter implements Splitter {
    protected Map<TableID, MemoryTable> memoryTableMap = new HashMap<>();
    protected DiskTable diskTable;
    public AbstractSplitter(ModStrategy modStrategy, CheckPoint checkPoint, DiskTable d) {
        this.modStrategy = modStrategy;
        this.checkPoint = checkPoint;
        this.diskTable = d;
    }
    @Override
    public void writeToMemory(String s) {
        TableID tableID = modStrategy.mod(s);

//        memoryTableMap.getOrDefault(flushTableName,new SimpleMemoryTable(flushTableName)).add(s);
        if (memoryTableMap.containsKey(tableID)){
            memoryTableMap.get(tableID).add(s);
        }else {
            memoryTableMap.put(tableID,newMemoryTable(tableID,s));
        }
    }


    protected ModStrategy modStrategy;
    protected CheckPoint checkPoint;


    @Override
    public void split(String content) {
        if (checkPoint.needToCheckPoint()){
            checkpoint();
        }else{
            writeToMemory(content);
            checkPoint.updateCheckPoint();
        }
    }
    @Override
    public void checkpoint() {
        for (TableID tableID : memoryTableMap.keySet()) {
            checkPoint.flushMemoryTable(memoryTableMap.get(tableID),
                    diskTable);
        }

        checkPoint.resetCheckPoint();

    }


    @Override
    public MemoryTable newMemoryTable(TableID tableID, String s) {
        return null;
    }


}
