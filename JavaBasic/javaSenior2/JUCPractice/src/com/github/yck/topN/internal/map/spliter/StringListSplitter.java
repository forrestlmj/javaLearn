package com.github.yck.topN.internal.map.spliter;


import com.github.yck.topN.internal.map.ck.CheckPoint;
import com.github.yck.topN.internal.map.disktable.DiskTable;
import com.github.yck.topN.internal.map.strategy.ModStrategy;
import com.github.yck.topN.internal.map.memorytable.TableID;
import com.github.yck.topN.internal.map.memorytable.MemoryTable;
import com.github.yck.topN.internal.map.memorytable.StringListMemoryTable;

@Deprecated
public class StringListSplitter extends AbstractSplitter {

    public StringListSplitter(ModStrategy modStrategy, CheckPoint checkPoint, DiskTable d) {
        super(modStrategy, checkPoint, d);
    }
    @Override
    public MemoryTable newMemoryTable(TableID tableID, String s) {
        return new StringListMemoryTable(tableID,s);
    }

}
