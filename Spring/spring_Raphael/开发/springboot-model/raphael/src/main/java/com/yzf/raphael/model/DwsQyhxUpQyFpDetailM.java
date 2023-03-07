package com.yzf.raphael.model;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.math.BigInteger;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：9/27/20 6:12 PM
 */

@Data
@ApiModel(value="累计收票金额 TOP10 企业汇总", description="")
public class DwsQyhxUpQyFpDetailM {
    @ApiModelProperty(value = "企业", required = true)
    private BigInteger qyid;
    @ApiModelProperty(value = "会计年度", required = true)
    private BigInteger k_kjnd;
    @ApiModelProperty(value = "会计期间", required = true)
    private BigInteger k_kjqj;
    @ApiModelProperty(value = "交易对手名称", required = true)
    private String k_xfdwmc;
    @ApiModelProperty(value = "上游企业发票数量", required = true)
    private BigInteger up_fp_cnt;
    @ApiModelProperty(value = "收票金额", required = true)
    private double up_amt;
    @ApiModelProperty(value = "上游企业发票总数量")
    private BigInteger up_fp_sum_cnt;
    @ApiModelProperty(value = "上游企业发票总金额")
    private double up_sum_amt;
    @ApiModelProperty(value = "上游企业发票数量占比", required = true)
    private double up_fp_cnt_rate;
    @ApiModelProperty(value = "上游企业发票金额占比", required = true)
    private double up_fp_amt_rate;
}
