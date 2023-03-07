package com.yzf.raphael.model ;

import io.swagger.annotations.ApiModelProperty;


import io.swagger.annotations.ApiModel ;
import lombok.Data ;

import java.math.BigInteger;


/**
 * @author ：xxx
 * @description：TODO
 * @date ：9/27/20 8:09 PM
 */

@Data
@ApiModel(value="单张收票金额 TOP10 企业", description="")
public class DwdFactFpSpzbTyD {
    @ApiModelProperty(value = "set标签")
    private String set_cd ;
    @ApiModelProperty(value = "开票主键")
    private BigInteger k_fpid ;
    @ApiModelProperty(value = "企业", required = true)
    private BigInteger qyid ;
    @ApiModelProperty(value = "企业名称", required = true)
    private String qymc ;
    @ApiModelProperty(value = "公司id")
    private BigInteger gsid ;
    @ApiModelProperty(value = "公司名称")
    private String gsmc ;
    @ApiModelProperty(value = "账套代码")
    private String k_ztdm ;
    @ApiModelProperty(value = "账套名称")
    private String k_ztmc ;
    @ApiModelProperty(value = "会计年度", required = true)
    private BigInteger k_kjnd ;
    @ApiModelProperty(value = "会计期间", required = true)
    private BigInteger k_kjqj ;
    @ApiModelProperty(value = "年度月份", required = true)
    private String kjndqj ;
    @ApiModelProperty(value = "单据来源", required = true)
    private String k_djly ;
    @ApiModelProperty(value = "发票种类", required = true)
    private String k_kpzlid ;
    @ApiModelProperty(value = "")
    private String k_ymlx ;
    @ApiModelProperty(value = "金额合计", required = true)
    private double k_jehj ;
    @ApiModelProperty(value = "税额合计", required = true)
    private double k_sehj ;
    @ApiModelProperty(value = "价税合计")
    private double k_jshj ;
    @ApiModelProperty(value = "")
    private String kzt ;
    @ApiModelProperty(value = "收方单位名称", required = true)
    private String k_xfdwmc ;
    @ApiModelProperty(value = "开票日期", required = true)
    private String k_kprq ;

}
