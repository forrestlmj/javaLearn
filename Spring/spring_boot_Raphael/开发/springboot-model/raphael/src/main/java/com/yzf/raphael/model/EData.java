package com.yzf.raphael.model;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Map;

@Data
@ApiModel(value = "供应链关系图谱-返回格式-节点信息")
public class EData{
    @ApiModelProperty(value = "图数据库内部Id")
    private String id;
    @ApiModelProperty(value = "节点-云帐房企业id，可能为空，为空表示不是云帐房企业", required = true)
    private String qyid;
    @ApiModelProperty(value = "节点属性，预留字段")
    private Map<String,String> property;


    public EData(String id, String qyid, String qymc, String desc) {
        id = id;
        this.qyid = qyid;
        this.qymc = qymc;
        this.desc = desc;
    }
    @ApiModelProperty(value = "节点-企业名称", required = true)
    private String qymc;
    @ApiModelProperty(value = "描述，预留字段")
    private String desc;

}