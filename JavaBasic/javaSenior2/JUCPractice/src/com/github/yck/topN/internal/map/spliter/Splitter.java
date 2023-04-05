package com.github.yck.topN.internal.map.spliter;

import com.github.yck.topN.internal.map.memorytable.MemoryTable;
import com.github.yck.topN.internal.map.memorytable.TableID;

public interface Splitter {

    void split(String content);
//    void writeToMemory(String s);
    void checkpoint();
    void writeToMemory(String s);
    MemoryTable newMemoryTable(TableID tableID,String s);
}
