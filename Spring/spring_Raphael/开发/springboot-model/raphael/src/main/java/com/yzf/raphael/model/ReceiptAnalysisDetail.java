package com.yzf.raphael.model;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.math.BigInteger;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：9/27/20 2:59 PM
 */

@Data
@ApiModel(value="销项、进项发票分析的明细", description="")
public class ReceiptAnalysisDetail {
    @ApiModelProperty(value = "会计年度", required = true)
    private int k_kjnd;
    @ApiModelProperty(value = "会计期间", required = true)
    private int k_kjqj;
    @ApiModelProperty(value = "企业id", required = true)
    private BigInteger qyid;
    @ApiModelProperty(value = "企业名称", required = true)
    private String qymc;
    @ApiModelProperty(value = "时间标识 区分本条数据的统计周期。1，月。2，季度（k_kjqj=1,4,7,10代表四个季度）3年度（k_kjqj=1）", required = true)
    private int flag;
    @ApiModelProperty(value = "金额", required = true)
    private double amt;

    public ReceiptAnalysisDetail() {
    }

    public ReceiptAnalysisDetail(int k_kjnd, int k_kjqj, BigInteger qyid, String qymc, int flag, double amt) {
        this.k_kjnd = k_kjnd;
        this.k_kjqj = k_kjqj;
        this.qyid = qyid;
        this.qymc = qymc;
        this.flag = flag;
        this.amt = amt;
    }
}
