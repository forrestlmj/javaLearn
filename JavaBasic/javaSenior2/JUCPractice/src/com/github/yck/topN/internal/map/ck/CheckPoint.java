package com.github.yck.topN.internal.map.ck;


import com.github.yck.topN.internal.map.disktable.DiskTable;
import com.github.yck.topN.internal.map.memorytable.MemoryTable;

public interface CheckPoint {
    void setMaxLineSize(Integer maxCheckPointLine);
    Integer getMaxCheckPointLine();
    boolean needToCheckPoint();
    void updateCheckPoint();
    void resetCheckPoint();
    boolean flushMemoryTable(MemoryTable memoryTable, DiskTable diskTable);
}
