package com.yzf.di.entity;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import javax.persistence.*;

@Table(indexes = {@Index(name = "idx_logicDatabase_logicTable",columnList = "logicDatabase,logicTable")})
@ApiModel(value = "逻辑视图的表结构")
@Entity
public class FdsLogicViewSchema {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @ApiModelProperty(value = "id")
    private Integer id;
    @Column(length = 40)
    @ApiModelProperty(value = "逻辑库")
    private String logicDatabase;
    @Column(length = 100)
    @ApiModelProperty(value = "逻辑表")
    private String logicTable;

    @Column
    @ApiModelProperty(value = "表注释")
    private String logicTableComment;

    @Override
    public String toString() {
        return "LogicViewSchemaDao{" +
                "id=" + id +
                ", logicDatabase='" + logicDatabase + '\'' +
                ", logicTable='" + logicTable + '\'' +
                ", logicTableComment='" + logicTableComment + '\'' +
                ", logicColumnName='" + logicColumnName + '\'' +
                ", logicColumnType='" + logicColumnType + '\'' +
                ", logicDataType='" + logicDataType + '\'' +
                ", logicColumnComment='" + logicColumnComment + '\'' +
                '}';
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

    public String getLogicTableComment() {
        return logicTableComment;
    }

    public void setLogicTableComment(String logicTableComment) {
        this.logicTableComment = logicTableComment;
    }

    public String getLogicColumnName() {
        return logicColumnName;
    }

    public void setLogicColumnName(String logicColumnName) {
        this.logicColumnName = logicColumnName;
    }

    public String getLogicColumnType() {
        return logicColumnType;
    }

    public void setLogicColumnType(String logicColumnType) {
        this.logicColumnType = logicColumnType;
    }

    public String getLogicDataType() {
        return logicDataType;
    }

    public void setLogicDataType(String logicDataType) {
        this.logicDataType = logicDataType;
    }

    public String getLogicColumnComment() {
        return logicColumnComment;
    }

    public void setLogicColumnComment(String logicColumnComment) {
        this.logicColumnComment = logicColumnComment;
    }

    @Column
    @ApiModelProperty(value = "列名")
    private String logicColumnName;
    @Column
    @ApiModelProperty(value = "列类型")
    private String logicColumnType;

    @Column
    @ApiModelProperty(value = "列类型(不带精度)",hidden = true)
    private String logicDataType;
    @Column
    @ApiModelProperty(value = "列注释")
    private String logicColumnComment;
}
