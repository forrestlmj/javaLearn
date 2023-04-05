package com.github.yck.topN.internal.map.ck;


import com.github.yck.topN.internal.map.disktable.DiskTable;
import com.github.yck.topN.internal.map.memorytable.MemoryTable;

import java.text.SimpleDateFormat;
import java.util.Date;


public class SimpleCheckPoint implements CheckPoint {
    /**
     * 有线程安全问题
     */
    private Integer checkPointPointer = 0;
    private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS");

    public Integer getCheckPointTime() {
        return checkPointTime;
    }

    private Integer checkPointTime = 0;

    public SimpleCheckPoint(Integer maxCheckPointLine) {
        this.maxCheckPointLine = maxCheckPointLine;
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
        checkPointTime++;
        System.out.println(sdf.format(new Date())+"完成第"+getCheckPointTime()+"次 CheckPoint，共处理" +
                ""+getMaxCheckPointLine()*getCheckPointTime()+" 条数据");

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
