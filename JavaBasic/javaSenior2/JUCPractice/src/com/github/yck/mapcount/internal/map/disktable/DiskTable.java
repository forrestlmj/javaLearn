package com.github.yck.mapcount.internal.map.disktable;

import com.github.yck.mapcount.internal.map.memorytable.TableID;

import java.util.List;

/**
 * 需要享元模式，uuid作为map
 *
 */
public interface DiskTable {
    void write(TableID tableId, List<String> content);
    void clean();
    void initTempWorkSpace(String path);
}
