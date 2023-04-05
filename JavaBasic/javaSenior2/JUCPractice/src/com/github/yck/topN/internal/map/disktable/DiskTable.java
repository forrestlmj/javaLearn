package com.github.yck.topN.internal.map.disktable;

import com.github.yck.topN.internal.map.memorytable.TableID;

import java.util.List;

/**
 * 需要享元模式，uuid作为map
 *
 */
public interface DiskTable {
    void write(TableID tableId, List<String> content);
    void write(TableID tableID, byte[] content,int offset);
    void initTempWorkSpace(String path);
}
