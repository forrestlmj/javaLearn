package com.yck.springbootselflearning.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * @author ：forrestlmj@github.com
 * @description：TODO
 * @date ：2021/1/4 上午11:20
 */

@ApiModel(value = "部门统计")
public class DeptSummary {

    @Override
    public String toString() {
        return "DeptSummary{" +
                "departmentName='" + departmentName + '\'' +
                ", peopleCount=" + peopleCount +
                ", SalaryCount=" + salaryCount +
                '}';
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public double getPeopleCount() {
        return peopleCount;
    }

    public void setPeopleCount(double peopleCount) {
        this.peopleCount = peopleCount;
    }

    public double getSalaryCount() {
        return salaryCount;
    }

    public void setSalaryCount(double salaryCount) {
        this.salaryCount = salaryCount;
    }
    @ApiModelProperty(value = "部门名称")
    private String departmentName;
    @ApiModelProperty(value = "人数统计")
    private double peopleCount;
    @ApiModelProperty(value = "薪资统计")
    private double salaryCount;
}
