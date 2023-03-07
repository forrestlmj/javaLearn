package com.yzf.di.dto;

import com.opencsv.bean.CsvBindByName;
import io.swagger.annotations.ApiModelProperty;

import javax.persistence.Column;

public class LogicViewMappingCSVDto  {
    @CsvBindByName(column = "逻辑库", required = true)
    private String logicDatabase;
    @CsvBindByName(column = "分库分表策略", required = true)
    private String shardingStrategy;

    public String getShardingStrategy() {
        return shardingStrategy;
    }

    public void setShardingStrategy(String shardingStrategy) {
        this.shardingStrategy = shardingStrategy;
    }

    @Override
    public String toString() {
        return "LogicViewMappingCSVDto{" +
                "logicDatabase='" + logicDatabase + '\'' +
                ", shardingStrategy='" + shardingStrategy + '\'' +
                ", logicTable='" + logicTable + '\'' +
                ", instance='" + instance + '\'' +
                ", tableSchema='" + tableSchema + '\'' +
                ", tableName='" + tableName + '\'' +
                '}';
    }

    public String getLogicDatabase() {
        return logicDatabase;
    }

    public void setLogicDatabase(String logicDatabase) {
        this.logicDatabase = logicDatabase;
    }

    public String getLogicTable() {
        return logicTable;
    }

    public void setLogicTable(String logicTable) {
        this.logicTable = logicTable;
    }

    public String getInstance() {
        return instance;
    }

    public void setInstance(String instance) {
        this.instance = instance;
    }

    public String getTableSchema() {
        return tableSchema;
    }

    public void setTableSchema(String tableSchema) {
        this.tableSchema = tableSchema;
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    @CsvBindByName(column = "逻辑表", required = true)
    private String logicTable;
    @CsvBindByName(column = "mysql实例", required = true)
    private String instance;
    @CsvBindByName(column = "mysql库名", required = true)
    private String tableSchema;
    @CsvBindByName(column = "mysql表名", required = true)
    private String tableName;
}
