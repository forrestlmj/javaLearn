package com.yzf.di.entity.po;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import javax.persistence.*;
import java.util.regex.Pattern;

@Table
@ApiModel(value = "Mysql数据字典")
@Entity
public class FdsMysqlDataDict {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @ApiModelProperty(value = "id")
    private Integer id;
    private static final Pattern pattern = Pattern.compile("_\\d*$");
    public String getLogicDatabase() {
        return pattern.matcher(getTableSchema()).replaceAll("").trim();
    }

    public String getLogicTable() {
        return pattern.matcher(getTableName()).replaceAll("").trim();
    }



    @Column
    @ApiModelProperty(value = "Mysql实例id")
    private Integer mysqlSourceId;

    public String getInstance() {
        return instance;
    }
    @Override
    public String toString() {
        return "MysqlDataDictDao{" +
                "id=" + id +
                ", mysqlSourceId=" + mysqlSourceId +
                ", instance='" + instance + '\'' +
                ", tableSchema='" + tableSchema + '\'' +
                ", tableName='" + tableName + '\'' +
                ", tableRows=" + tableRows +
                ", tableComment='" + tableComment + '\'' +
                ", columnName='" + columnName + '\'' +
                ", columnType='" + columnType + '\'' +
                ", dataType='" + dataType + '\'' +
                ", columnComment='" + columnComment + '\'' +
                '}';
    }

    public void setInstance(String instance) {
        this.instance = instance;
    }

    public Long getTableRows() {
        return tableRows;
    }

    @Column(length = 40)
    @ApiModelProperty(value = "Mysql实例名称")
    private String instance;

    @Column
    @ApiModelProperty(value = "数据库名")
    private String tableSchema;
    @Column
    @ApiModelProperty(value = "表名")
    private String tableName;


    public void setTableRows(Long tableRows) {
        this.tableRows = tableRows;
    }

    @Column
    @ApiModelProperty(value = "行数",hidden = true)
    private Long tableRows;
    @Column
    @ApiModelProperty(value = "表注释")
    private String tableComment;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public String getTableComment() {
        return tableComment;
    }

    public void setTableComment(String tableComment) {
        this.tableComment = tableComment;
    }

    public String getColumnName() {
        return columnName;
    }

    public void setColumnName(String columnName) {
        this.columnName = columnName;
    }

    public String getColumnType() {
        return columnType;
    }

    public void setColumnType(String columnType) {
        this.columnType = columnType;
    }

    public String getDataType() {
        return dataType;
    }

    public void setDataType(String dataType) {
        this.dataType = dataType;
    }

    public String getColumnComment() {
        return columnComment;
    }

    public FdsMysqlDataDict() {
    }

    public FdsMysqlDataDict(Integer mysqlSourceId, String instance, String tableSchema, String tableName, Long tableRows, String tableComment) {
        this.mysqlSourceId = mysqlSourceId;
        this.instance = instance;
        this.tableSchema = tableSchema;
        this.tableName = tableName;
        this.tableRows = tableRows;
        this.tableComment = tableComment;
    }

    public FdsMysqlDataDict(Integer mysqlSourceId, String instance, String tableSchema, String tableName, Long tableRows, String tableComment, String columnName, String columnType, String dataType, String columnComment) {
        this.mysqlSourceId = mysqlSourceId;
        this.instance = instance;
        this.tableSchema = tableSchema;
        this.tableName = tableName;
        this.tableRows = tableRows;
        this.tableComment = tableComment;
        this.columnName = columnName;
        this.columnType = columnType;
        this.dataType = dataType;
        this.columnComment = columnComment;
    }

    public void setColumnComment(String columnComment) {
        this.columnComment = columnComment;
    }

    @Column
    @ApiModelProperty(value = "列名")
    private String columnName;
    @Column
    @ApiModelProperty(value = "列类型")
    private String columnType;

    @Column
    @ApiModelProperty(value = "列类型(不带精度)",hidden = true)
    private String dataType;
    @Column
    @ApiModelProperty(value = "列注释")
    private String columnComment;
}
