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
@ApiModel(value="累计开票金额 TOP10 企业汇总", description="")
public class DwsQyhxDownQyFpDetailM {
    @ApiModelProperty(value = "企业", required = true)
    private BigInteger qyid;
    @ApiModelProperty(value = "会计年度", required = true)
    private BigInteger k_kjnd;
    @ApiModelProperty(value = "会计期间", required = true)
    private BigInteger k_kjqj;
    @ApiModelProperty(value = "交易对手名称", required = true)
    private String k_gfdwmc;
    @ApiModelProperty(value = "下游企业发票数量", required = true)
    private BigInteger down_fp_cnt;
    @ApiModelProperty(value = "开票金额", required = true)
    private double down_amt;
    @ApiModelProperty(value = "下游企业发票总数量")
    private BigInteger down_fp_sum_cnt;
    @ApiModelProperty(value = "下游企业发票总金额")
    private double down_sum_amt;
    @ApiModelProperty(value = "下游企业发票数量占比", required = true)
    private double down_fp_cnt_rate;
    @ApiModelProperty(value = "下游企业发票金额占比", required = true)
    private double down_fp_amt_rate;

}
