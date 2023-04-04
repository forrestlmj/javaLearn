package com.github.yck.mapcount.internal.map.ck;


import com.github.yck.mapcount.internal.map.disktable.DiskTable;
import com.github.yck.mapcount.internal.map.memorytable.MemoryTable;


public class SimpleCheckPoint implements CheckPoint {
    /**
     * 有线程安全问题
     */
    private Integer checkPointPointer;
    public SimpleCheckPoint(Integer maxCheckPointLine) {
        this.maxCheckPointLine = maxCheckPointLine;
        resetCheckPoint();
    }

    private Integer maxCheckPointLine;
    @Override
    public void setMaxLineSize(Integer maxCheckPointLine) {
        maxCheckPointLine = maxCheckPointLine;
    }

    @Override
    public Integer getMaxCheckPointLine() {
        return maxCheckPointLine;
    }

    @Override
    public boolean needToCheckPoint() {
        return checkPointPointer >= getMaxCheckPointLine();
    }

    @Override
    public void updateCheckPoint() {
        checkPointPointer++;
    }

    /**
     * TODO checkpoint {@link MemoryTable} 与 {@link DiskTable}
     */
    @Override
    public void resetCheckPoint() {
        checkPointPointer = 0;
    }

    /**
     * TODO 涉及数据的传递 flush 过程，这里还要用到 享元模式
     * @param memoryTable
     * @param diskTable
     * @return
     */
    @Override
    public boolean flushMemoryTable(MemoryTable memoryTable, DiskTable diskTable) {
        if(memoryTable.flush(memoryTable.getTableID(),diskTable)){
            memoryTable.clean();return true;
        }else return false;
    }
}
