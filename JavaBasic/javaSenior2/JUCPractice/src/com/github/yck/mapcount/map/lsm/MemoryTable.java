package com.github.yck.mapcount.map.lsm;

public interface MemoryTable {
    void add(String data);

    /**
     * 备忘录模式,刷写到磁盘
     */
    boolean flush();
    void setMemorySize();

    /**
     * 将MemoryTable中清除
     */
    void clean();
}
