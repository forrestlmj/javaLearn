package com.yck.springbootselflearning.dao;

import com.google.inject.internal.cglib.proxy.$FixedValue;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import sun.awt.SunHints;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author ：yangchengkai@yunzhangfang.com
 * @description：TODO
 * @date ：2021/1/14 下午2:10
 */

@ApiModel(value = "学生，HBase存储")
public class Stu {
    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getTel() {
        return tel;
    }

    @Override
    public String toString() {
        return "Stu{" +
                "name='" + name + '\'' +
                ", gender='" + gender + '\'' +
                ", tel='" + tel + '\'' +
                ", id='" + id + '\'' +
                '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }
    @ApiModelProperty(value = "性别")
    private String gender;
    @ApiModelProperty(value = "电话")
    private String tel;
    @ApiModelProperty(value = "标志符号")
    private String id;
}
