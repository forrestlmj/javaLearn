package com.yck.springbootselflearning.dao;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import javax.persistence.*;

/**
 * @author ：forrestlmj@github.com
 * @description：TODO
 * @date ：2021/1/1 下午12:46
 */
@Entity
@Table
@ApiModel(value = "雇员")
public class Employee {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @ApiModelProperty(value = "雇员id")
    private Integer id;

    @Column
    @ApiModelProperty(value = "姓名")
    private String lastName;

    @Column
    @ApiModelProperty(value = "邮箱地址")
    private String email;

    @Column
    @ApiModelProperty(value = "薪水")
    private double salary;
    @Override
    public String toString() {
        return "Employee{" +
                "id=" + id +
                ", lastName='" + lastName + '\'' +
                ", email='" + email + '\'' +
                ", salary=" + salary +
                ", deptId=" + deptId +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    private Integer deptId;

    public Double getSalary() {
        return salary;
    }

    public void setSalary(Double salary) {
        this.salary = salary;
    }
}
