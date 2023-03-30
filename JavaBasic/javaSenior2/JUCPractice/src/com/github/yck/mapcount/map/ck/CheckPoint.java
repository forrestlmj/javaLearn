package com.github.yck.mapcount.map.ck;


import com.github.yck.mapcount.map.lsm.MemoryTable;

public interface CheckPoint {
    void setMaxLineSize(Integer maxCheckPointLine);
    Integer getMaxCheckPointLine();
    boolean needToCheckPoint();
    void updateCheckPoint();
    void resetCheckPoint();
    boolean flushMemoryTable(MemoryTable memoryTable);
}
