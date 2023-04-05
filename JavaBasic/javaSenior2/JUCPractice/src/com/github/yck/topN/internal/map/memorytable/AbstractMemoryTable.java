package com.github.yck.topN.internal.map.memorytable;

import com.github.yck.topN.internal.map.disktable.DiskTable;

public class AbstractMemoryTable implements MemoryTable {
    TableID f;

    @Override
    public void add(String data) {

    }

    @Override
    public void add(byte[] data) {

    }

    @Override
    public TableID getTableID() {
        return f;
    }

    @Override
    public boolean flush(TableID id, DiskTable d) {
        return false;
    }


    @Override
    public void setMemorySize() {

    }

    @Override
    public void clean() {

    }


}
