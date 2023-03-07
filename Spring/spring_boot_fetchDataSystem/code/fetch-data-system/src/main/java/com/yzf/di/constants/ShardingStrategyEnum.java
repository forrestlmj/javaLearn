package com.yzf.di.constants;

public enum ShardingStrategyEnum {
    NONSHARDING("NONSHARDING"),
    SHARDING_DB("SHARDING_DB"),
    SHARDING_TBL("SHARDING_TBL"),
    SHARDING_DB_TBL("SHARDING_DB_TBL"),
    ;
    private final String value;
    private ShardingStrategyEnum(String value) {
        this.value = value;
    }

    public String value() {
        return value;
    }
}
