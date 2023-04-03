package com.github.yck.mapcount.map.disktable;

import com.github.yck.mapcount.map.lsm.TableID;

import java.util.List;

public class FlyWeightDiskTable implements DiskTable {
    private TableID tableID;
    public FlyWeightDiskTable(TableID tableID) {
        this.tableID = tableID;
    }

    @Override
    public void write(TableID tableId, List<String> content) {

    }

    @Override
    public void clean() {

    }
}
