package com.yzf.raphael.model;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.math.BigInteger;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：9/24/20 8:40 PM
 */

@Data
@ApiModel(value = "企业高管信息")
public class Employ {
    @ApiModelProperty(value = "云帐房企业id", required = true)
    private BigInteger qyid;
    @ApiModelProperty(value = "企业名称", required = true)
    private String qymc;
    @ApiModelProperty(value = "姓名", required = true)
    private String ent_name;
    @ApiModelProperty(value = "职务", required = true)
    private String job_title;
}
