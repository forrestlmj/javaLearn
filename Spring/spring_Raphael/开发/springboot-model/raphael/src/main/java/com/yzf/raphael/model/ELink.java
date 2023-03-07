package com.yzf.raphael.model;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Map;

@Data
@ApiModel(value = "供应链关系图谱-返回格式-边信息")
public class ELink{
    @ApiModelProperty(value = "图数据库内部Id")
    private String id;
    @ApiModelProperty(value = "起始节点", required = true)
    private String source;
    @ApiModelProperty(value = "终止节点", required = true)
    private String target;
    @ApiModelProperty(value = "属性map:{up_fp_cnt,发票数量，up_amt，发票金额}", required = true)
    private Map<String,String> property;
    @ApiModelProperty(value = "描述，预留字段。")
    private String desc;

    public ELink(String id, String source, String target,Map<String,String> property) {
        id = id;
        this.source = source;
        this.target = target;
        this.property = property;
    }
}