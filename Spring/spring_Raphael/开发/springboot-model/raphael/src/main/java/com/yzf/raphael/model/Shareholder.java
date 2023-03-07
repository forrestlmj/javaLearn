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
@ApiModel(value = "企业股东信息")
public class Shareholder {
    @ApiModelProperty(value = "云帐房企业id", required = true)
    private BigInteger qyid;
    @ApiModelProperty(value = "企业名称", required = true)
    private String qymc;
    @ApiModelProperty(value = "股东姓名", required = true)
    private String holder_name ;
    @ApiModelProperty(value = "股东类型", required = true)
    private String holder_type ;
    @ApiModelProperty(value = "持股比例", required = true)
    private String holder_radio;
    @ApiModelProperty(value = "认缴出资额", required = true)
    private String should_capi ;
    @ApiModelProperty(value = "认缴方式", required = true)
    private String subscribed_type ;
    @ApiModelProperty(value = "认缴时间", required = true)
    private String subscribed_time;

}
