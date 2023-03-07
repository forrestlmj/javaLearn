package com.yzf.raphael.model;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.math.BigInteger;

/**
 * @author ：xxx
 * @description：销项发票
 * @date ：9/22/20 8:37 PM
 */

@Data
@ApiModel(value="销项发票信息", description="")
public class DwsQyhxXxfpAnalysisM {
    @ApiModelProperty(value = "set标签")
    private String set_cd;
    @ApiModelProperty(value = "会计年度", required = true)
    private int k_kjnd;
    @ApiModelProperty(value = "会计期间", required = true)
    private int k_kjqj;
    @ApiModelProperty(value = "企业id", required = true)
    private BigInteger qyid;
    @ApiModelProperty(value = "企业名称", required = true)
    private String qymc;
    @ApiModelProperty(value = "公司id")
    private BigInteger gsid;
    @ApiModelProperty(value = "公司名称")
    private String gsmc;
    @ApiModelProperty(value = "地区代码")
    private String area_code;
    @ApiModelProperty(value = "地区名称")
    private String area_name;
    @ApiModelProperty(value = "红冲数量", required = true)
    private BigInteger red_cnt;
    @ApiModelProperty(value = "红冲金额", required = true)
    private double red_amt;
    @ApiModelProperty(value = "红冲税额", required = true)
    private double red_tax;
    @ApiModelProperty(value = "作废数量", required = true)
    private BigInteger void_cnt;
    @ApiModelProperty(value = "作废金额", required = true)
    private double void_amt;
    @ApiModelProperty(value = "作废税额", required = true)
    private double void_tax;
    @ApiModelProperty(value = "专票数量", required = true)
    private BigInteger special_cnt;
    @ApiModelProperty(value = "专票金额", required = true)
    private double special_amt;
    @ApiModelProperty(value = "专票税额", required = true)
    private double special_tax;
    @ApiModelProperty(value = "普票数量", required = true)
    private BigInteger general_cnt;
    @ApiModelProperty(value = "普票金额", required = true)
    private double general_amt;
    @ApiModelProperty(value = "普票税额", required = true)
    private double general_tax;
    @ApiModelProperty(value = "红冲金额占比", required = true)
    private double red_amt_rate;
    @ApiModelProperty(value = "红冲数量占比", required = true)
    private double red_cnt_rate;
    @ApiModelProperty(value = "作废金额占比", required = true)
    private double void_amt_rate;
    @ApiModelProperty(value = "作废数量占比", required = true)
    private double void_cnt_rate;
    @ApiModelProperty(value = "专票金额占比", required = true)
    private double special_amt_rate;
    @ApiModelProperty(value = "专票数量占比", required = true)
    private double special_cnt_rate;
    @ApiModelProperty(value = "普票金额占比", required = true)
    private double general_amt_rate;
    @ApiModelProperty(value = "普票数量占比", required = true)
    private double general_cnt_rate;
    @ApiModelProperty(value = "总数量", required = true)
    private BigInteger sum_cnt;
    @ApiModelProperty(value = "总金额", required = true)
    private double sum_amt;
    @ApiModelProperty(value = "手工销项发票数量")
    private BigInteger hand_cnt;
    @ApiModelProperty(value = "top10下游企业的交易额占比")
    private double down_top10_rate;
    @ApiModelProperty(value = "下游企业数量")
    private BigInteger down_qy_cnt;
    @ApiModelProperty(value = "历史首次开票日期")
    private String first_kprq;
    @ApiModelProperty(value = "最后开票日期")
    private String last_kprq;
    @ApiModelProperty(value = "时间标识 区分本条数据的统计周期。1，月。2，季度（k_kjqj=1,4,7,10代表四个季度）3年度（k_kjqj=1）", required = true)
    private int flag;

}
