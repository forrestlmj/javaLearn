package com.yck.springbootselflearning.dao;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import javax.persistence.*;

/**
 * @author ：forrestlmj@github.com
 * @description：TODO
 * @date ：2021/1/1 下午12:47
 */
@Entity
@Table
@ApiModel(value = "部门")
public class Department {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @ApiModelProperty(value = "部门id")
    private Integer id;
    public Integer getId() {
        return id;
    }

    @Override
    public String toString() {
        return "Department{" +
                "id=" + id +
                ", departmentName='" + departmentName + '\'' +
                '}';
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }
    @Column
    @ApiModelProperty("部门名称")
    private String departmentName;
}
