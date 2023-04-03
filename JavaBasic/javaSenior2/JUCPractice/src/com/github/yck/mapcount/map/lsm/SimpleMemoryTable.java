package com.github.yck.mapcount.map.lsm;

import com.github.yck.mapcount.map.disktable.DiskTable;

import java.util.ArrayList;
import java.util.List;

public class SimpleMemoryTable implements MemoryTable {
    private TableID f;
    private List<String> content = new ArrayList<>();

    public SimpleMemoryTable(TableID f, String data) {
        this.f = f;
        add(data);
    }

    @Override
    public void add(String data) {
        content.add(data);
    }

    @Override
    public TableID getTableID() {
        return f;
    }

    @Override
    public boolean flush(TableID id,DiskTable d) {
        d.write(getTableID(),content);
        System.out.println("文件："+f.getUuid()+"已写入："+content.size()+"行");
//        content.forEach(o->{
//            System.out.println("已经刷写到："+o);
//        });
        return true;
    }

    @Override
    public void setMemorySize() {

    }

    @Override
    public void clean() {
        content.clear();
    }
}
