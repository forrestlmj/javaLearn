package com.yzf.di.entity.po;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import javax.persistence.*;
import java.util.Objects;

@Table(indexes = {@Index(name = "idx_logicDatabase_logicTable",columnList = "logicDatabase,logicTable")})
@ApiModel(value = "逻辑视图映射到mysql表")
@Entity
public class FdsLogicViewMapping {
    public FdsLogicViewMapping() {
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        FdsLogicViewMapping that = (FdsLogicViewMapping) o;
        return Objects.equals(logicDatabase, that.logicDatabase) && Objects.equals(logicTable, that.logicTable);
    }

    @Override
    public int hashCode() {
        return Objects.hash(logicDatabase, logicTable);
    }

    public FdsLogicViewMapping(String logicDatabase, String logicTable) {
        this.logicDatabase = logicDatabase;
        this.logicTable = logicTable;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @ApiModelProperty(value = "id")
    private Integer id;

    @Override
    public String toString() {
        return "FdsLogicViewMapping{" +
                "id=" + id +
                ", logicDatabase='" + logicDatabase + '\'' +
                ", logicTable='" + logicTable + '\'' +
                ", mysqlSourceId=" + mysqlSourceId +
                ", mappingMethod='" + mappingMethod + '\'' +
                ", shardingStrategy='" + shardingStrategy + '\'' +
                ", tableSchema='" + tableSchema + '\'' +
                ", tableName='" + tableName + '\'' +
                '}';
    }

    @Column(length = 40)
    @ApiModelProperty(value = "逻辑库")
    private String logicDatabase;
    @Column(length = 100)
    @ApiModelProperty(value = "逻辑表")
    private String logicTable;

    @Column
    @ApiModelProperty(value = "sql源")
    private Integer mysqlSourceId;




    public FdsLogicViewMapping(String logicDatabase, String logicTable, Integer mysqlSourceId, String mappingMethod, String tableSchema, String tableName) {
        this.logicDatabase = logicDatabase;
        this.logicTable = logicTable;
        this.mysqlSourceId = mysqlSourceId;
        this.mappingMethod = mappingMethod;
        this.tableSchema = tableSchema;
        this.tableName = tableName;
    }

    @Column()
    @ApiModelProperty(value = "映射方式")
    private String  mappingMethod;

    @Column()
    @ApiModelProperty(value = "分库分表策略")
    private String shardingStrategy;

    public String getMappingMethod() {
        return mappingMethod;
    }

    public void setMappingMethod(String mappingMethod) {
        this.mappingMethod = mappingMethod;
    }

    public String getShardingStrategy() {
        return shardingStrategy;
    }

    public void setShardingStrategy(String shardingStrategy) {
        this.shardingStrategy = shardingStrategy;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public Integer getMysqlSourceId() {
        return mysqlSourceId;
    }

    public void setMysqlSourceId(Integer mysqlSourceId) {
        this.mysqlSourceId = mysqlSourceId;
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

    @Column
    @ApiModelProperty(value = "库名")
    private String tableSchema;
    @Column
    @ApiModelProperty(value = "表名")
    private String tableName;
}
