package com.github.yck.mapcount.map.ck;


import com.github.yck.mapcount.map.lsm.MemoryTable;


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

    @Override
    public void resetCheckPoint() {
        checkPointPointer = 0;
    }

    @Override
    public boolean flushMemoryTable(MemoryTable memoryTable) {
        if(memoryTable.flush()){
            memoryTable.clean();return true;
        }else return false;
    }
}
