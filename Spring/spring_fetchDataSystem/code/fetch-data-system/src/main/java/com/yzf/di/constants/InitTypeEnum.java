package com.yzf.di.constants;

public enum InitTypeEnum {
    TRION("TRION"),
    EMR_HIVE("EMR_HIVE"),
    EMR_KUDU("EMR_KUDU");

    public String value() {
        return value;
    }

    private final String value;

    private InitTypeEnum(String value) {
        this.value = value;
    }
}
