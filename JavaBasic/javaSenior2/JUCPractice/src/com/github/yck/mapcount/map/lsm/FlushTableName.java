package com.github.yck.mapcount.map.lsm;

import java.util.Objects;

public class FlushTableName {
    public FlushTableName(String uuid) {
        this.uuid = uuid;
    }

    private String uuid;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        FlushTableName that = (FlushTableName) o;

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
