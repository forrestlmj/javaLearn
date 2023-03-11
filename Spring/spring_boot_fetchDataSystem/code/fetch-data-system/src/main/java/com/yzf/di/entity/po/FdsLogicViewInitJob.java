package com.yzf.di.entity.po;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import javax.persistence.*;
import java.util.Date;

@Table
@ApiModel(value = "初始化详情")
@Entity
public class FdsLogicViewInitJob {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @ApiModelProperty(value = "任务id")
    private Integer id;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }


    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Long getRunTime() {
        return runTime;
    }

    public void setRunTime(Long runTime) {
        this.runTime = runTime;
    }

    public Integer getDataCount() {
        return dataCount;
    }

    public void setDataCount(Integer dataCount) {
        this.dataCount = dataCount;
    }

    public Double getDataSizeM() {
        return dataSizeM;
    }

    public void setDataSizeM(Double dataSizeM) {
        this.dataSizeM = dataSizeM;
    }

    public String getInitName() {
        return initName;
    }

    public void setInitName(String initName) {
        this.initName = initName;
    }

    public String getInitType() {
        return initType;
    }

    public void setInitType(String initType) {
        this.initType = initType;
    }

    @Override
    public String toString() {
        return "FdsLogicViewInitJob{" +
                "id=" + id +
                ", initName='" + initName + '\'' +
                ", initType='" + initType + '\'' +
                ", startTime=" + startTime +
                ", endTime=" + endTime +
                ", runTime=" + runTime +
                ", dataCount=" + dataCount +
                ", dataSizeM=" + dataSizeM +
                ", status='" + status + '\'' +
                '}';
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    @Column(length = 140)
    @ApiModelProperty(value = "初始化名称")
    private String initName;
    @Column(length = 10)
    @ApiModelProperty(value = "初始化类型")
    private String initType;
    @Column
    @ApiModelProperty(value = "初始化开始时间")
    private Date startTime;
    @Column
    @ApiModelProperty(value = "结束时间")
    private Date endTime;

    @Column
    @ApiModelProperty(value = "耗时")
    private Long runTime;

    @Column
    @ApiModelProperty(value = "数据条数")
    private Integer dataCount;

    @Column
    @ApiModelProperty(value = "数据量")
    private Double dataSizeM;
    @Column
    @ApiModelProperty(value = "状态")
    private String status;

}
