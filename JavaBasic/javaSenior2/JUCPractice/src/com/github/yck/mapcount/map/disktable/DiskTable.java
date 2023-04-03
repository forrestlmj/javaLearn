package com.github.yck.mapcount.map.disktable;

import com.github.yck.mapcount.map.lsm.TableID;

import java.util.List;

/**
 * 需要享元模式，uuid作为map
 *
 */
public interface DiskTable {
    void write(TableID tableId, List<String> content);
    void clean();
}
