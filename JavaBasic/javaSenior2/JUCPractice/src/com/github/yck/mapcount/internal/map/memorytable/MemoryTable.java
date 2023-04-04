package com.github.yck.mapcount.internal.map.memorytable;

import com.github.yck.mapcount.internal.map.disktable.DiskTable;

public interface MemoryTable {
    void add(String data);
    TableID getTableID();
    /**
     * 备忘录模式,刷写到磁盘
     */
    boolean flush(TableID id, DiskTable d);
    void setMemorySize();

    /**
     * 将MemoryTable中清除
     */
    void clean();
}
