package com.github.yck.topN.internal.map.memorytable;

import com.github.yck.topN.internal.map.disktable.DiskTable;

import java.util.ArrayList;
import java.util.List;
@Deprecated
public class StringListMemoryTable extends AbstractMemoryTable {
    private List<String> StringContent = new ArrayList<>();

    public StringListMemoryTable(TableID f, String data) {
        this.f = f;
        add(data);
    }

    @Override
    public void add(String data) {
        StringContent.add(data);
    }
    @Override
    public void clean() {
        StringContent.clear();
    }
    @Override
    public boolean flush(TableID id, DiskTable d) {
        d.write(getTableID(),StringContent);
        return true;
    }


}
