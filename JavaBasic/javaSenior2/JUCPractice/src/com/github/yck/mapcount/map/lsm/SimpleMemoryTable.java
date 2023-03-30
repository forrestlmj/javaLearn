package com.github.yck.mapcount.map.lsm;

import java.util.ArrayList;
import java.util.List;

public class SimpleMemoryTable implements MemoryTable {
    private FlushTableName f;
    private List<String> content = new ArrayList<>();

    public SimpleMemoryTable(FlushTableName f,String data) {
        this.f = f;
        add(data);
    }

    @Override
    public void add(String data) {
        content.add(data);
    }

    @Override
    public boolean flush() {
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
