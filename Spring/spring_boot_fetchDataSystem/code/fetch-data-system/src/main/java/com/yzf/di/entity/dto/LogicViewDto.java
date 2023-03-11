package com.yzf.di.entity.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel(value = "逻辑视图")
public class LogicViewDto {



    @ApiModelProperty(value = "逻辑库")
    private String logicDatabase;

    @ApiModelProperty(value = "逻辑表")
    private String logicTable;

    @Override
    public String toString() {
        return "LogicViewDto{" +
                ", logicDatabase=" + logicDatabase +
                ", logicTable='" + logicTable + '\'' +
                ", instance='" + instance + '\'' +
                ", tableRows=" + tableRows +
                ", mysqlSourceId='" + mysqlSourceId + '\'' +
                ", shardingStrategy='" + shardingStrategy + '\'' +
                ", tableSchema='" + tableSchema + '\'' +
                ", tableName='" + tableName + '\'' +
                '}';
    }

    @ApiModelProperty(value = "实例名称")
    private String instance;

    public String getInstance() {
        return instance;
    }

    public void setInstance(String instance) {
        this.instance = instance;
    }

    public Long getTableRows() {
        return tableRows;
    }

    public void setTableRows(Long tableRows) {
        this.tableRows = tableRows;
    }

    @ApiModelProperty(value = "行数")
    private Long tableRows;

    @ApiModelProperty(value = "sql源",hidden = true)
    private String mysqlSourceId;
    @ApiModelProperty(value = "映射方式")
    private String mappingMethod;

    @ApiModelProperty(value = "分库分表策略")
    private String shardingStrategy;



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

    public String getMysqlSourceId() {
        return mysqlSourceId;
    }

    public void setMysqlSourceId(String mysqlSourceId) {
        this.mysqlSourceId = mysqlSourceId;
    }


    public LogicViewDto(String logicDatabase, String logicTable, String instance, Long tableRows, String mysqlSourceId, String mappingMethod, String shardingStrategy, String tableSchema, String tableName) {
        this.logicDatabase = logicDatabase;
        this.logicTable = logicTable;
        this.instance = instance;
        this.tableRows = tableRows;
        this.mysqlSourceId = mysqlSourceId;
        this.mappingMethod = mappingMethod;
        this.shardingStrategy = shardingStrategy;
        this.tableSchema = tableSchema;
        this.tableName = tableName;
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

    @ApiModelProperty(value = "库名")
    private String tableSchema;
    @ApiModelProperty(value = "表名")
    private String tableName;
}
