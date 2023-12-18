package com.github.yck.topN.internal.map.spliter;


import com.github.yck.topN.internal.map.ck.CheckPoint;
import com.github.yck.topN.internal.map.disktable.DiskTable;
import com.github.yck.topN.internal.map.memorytable.ByteMemoryTable;
import com.github.yck.topN.internal.map.memorytable.MemoryTable;
import com.github.yck.topN.internal.map.memorytable.TableID;
import com.github.yck.topN.internal.map.strategy.ModStrategy;

public class ByteSplitter extends AbstractSplitter {
    private int kbSize;

    /**
     * @param modStrategy 切割的文件数量
     * @param checkPoint ck 策略
     * @param d 使用怎样的磁盘写入策略
     * @param kbSize 刷写磁盘前最多保存的数据量
     */
    public ByteSplitter(ModStrategy modStrategy, CheckPoint checkPoint, DiskTable d,int kbSize) {
        super(modStrategy, checkPoint, d);
        this.kbSize =kbSize;
    }

    @Override
    public MemoryTable newMemoryTable(TableID tableID, String s) {
        return new ByteMemoryTable(tableID,s,kbSize);
    }
}
