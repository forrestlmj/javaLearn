package com.yzf.di.constants;

/**
 * AUTOMATIC 程序自动匹配
 * MANUAL 用户通过web界面匹配
 * MANUAL_DEFINED_IN_FILE 在代码的配置文件中配置
 */
public enum MappingMethodEnum {
    AUTOMATIC("AUTOMATIC"),
    MANUAL("MANUAL"),
    MANUAL_DEFINED_IN_FILE("MANUAL_DEFINED_IN_FILE");
    private final String value;
    private MappingMethodEnum(String value) {
        this.value = value;
    }
    public String value() {
        return value;
    }
}
