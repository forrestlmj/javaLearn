package com.yzf.di.entity;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import javax.persistence.*;
import java.util.Date;
@Table
@ApiModel(value = "Mysql数据源")
@Entity
public class FdsMysqlSource {
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public FdsMysqlSource() {
    }

    public FdsMysqlSource(String instance, String ip) {
        this.instance = instance;
        this.ip = ip;
    }

    public FdsMysqlSource(Integer id, String instance, String ip) {
        this.id = id;
        this.instance = instance;
        this.ip = ip;
    }

    public FdsMysqlSource(Integer id, String instance, String ip, String username, String password, String remark, boolean isDeleted, Date lastFetchTime) {
        this.id = id;
        this.instance = instance;
        this.ip = ip;
        this.username = username;
        this.password = password;
        this.remark = remark;
        this.lastFetchTime = lastFetchTime;
    }

    @Override
    public String toString() {
        return "MysqlSourceDao{" +
                "id=" + id +
                ", instance='" + instance + '\'' +
                ", ip='" + ip + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", remark='" + remark + '\'' +
                ", lastFetchTime=" + lastFetchTime +
                '}';
    }

    public String getInstance() {
        return instance;
    }

    public void setInstance(String instance) {
        this.instance = instance;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }



    public Date getLastFetchTime() {
        return lastFetchTime;
    }

    public void setLastFetchTime(Date lastFetchTime) {
        this.lastFetchTime = lastFetchTime;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @ApiModelProperty(value = "id")
    private Integer id;
    @Column(length = 40,unique = true)
    @ApiModelProperty(value = "Mysql实例名称",example = "ndz_account_0-container")
    private String instance;
    @Column(length = 20,unique = true)
    @ApiModelProperty(value = "ip:port",example = "172.37.4.57:3357")
    private String ip;
    @Column
    @ApiModelProperty(value = "用户名",example = "root")
    private String username;
    @Column
    @ApiModelProperty(value = "密码",example = "yzf@2015",dataType = "String")
    private String password;
    @Column
    @ApiModelProperty(value = "备注",example = "yck本机的mysql实例")
    private String remark;

    @Column
    @ApiModelProperty(value = "最后刷新时间",hidden = true)
    private Date lastFetchTime;
}
