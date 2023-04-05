package com.github.yck.topN.internal.map.memorytable;

import java.util.Objects;

/**
 *
 * New 了太多重复对象，要看Heap文件中的数量
 */
public class TableID {
    public TableID(String uuid) {
        this.uuid = uuid;
    }

    private String uuid;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        TableID that = (TableID) o;

        return Objects.equals(uuid, that.uuid);
    }

    @Override
    public int hashCode() {
        return uuid != null ? uuid.hashCode() : 0;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUUId(String uuid) {
        this.uuid = uuid;
    }
}
