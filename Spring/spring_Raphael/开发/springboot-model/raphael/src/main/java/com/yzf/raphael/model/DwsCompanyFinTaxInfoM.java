package com.yzf.raphael.model;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.math.BigInteger;

/**
 * @author ：xxx
 * @description：财务税务指标表
 * @date ：9/22/20 8:37 PM
 */

@Data
@ApiModel(value = "凭证情况与纳税额情况分析表", description="")
public class DwsCompanyFinTaxInfoM {
    @ApiModelProperty(value = "set标签")
    private String set_cd;
    @ApiModelProperty(value = "会计年度",required = true)
    private int k_kjnd;
    @ApiModelProperty(value = "会计期间",required = true)
    private int k_kjqj;
    @ApiModelProperty(value = "企业id")
    private BigInteger qyid;
    @ApiModelProperty(value = "企业名称")
    private String qymc;
    @ApiModelProperty(value = "公司id")
    private BigInteger gsid;
    @ApiModelProperty(value = "公司名称")
    private String gsmc;
    @ApiModelProperty(value = "公司地区编码")
    private String area_code;
    @ApiModelProperty(value = "公司地区名称")
    private String area_name;
    @ApiModelProperty(value = "实发薪资",required = true)
    private double total_salary;
    @ApiModelProperty(value = "月人均薪资",required = true)
    private double avg_salary;
    @ApiModelProperty(value = "凭证数",required = true)
    private BigInteger voucher_cnt;
    @ApiModelProperty(value = "手工凭证数",required = true)
    private BigInteger manual_voucher_cnt;
    @ApiModelProperty(value = "银行清单凭证数",required = true)
    private BigInteger bank_voucher_cnt;
    @ApiModelProperty(value = "费用清单凭证数",required = true)
    private BigInteger fee_voucher_cnt;
    @ApiModelProperty(value = "税金计提凭证数",required = true)
    private BigInteger tax_provision_voucher_cnt;
    @ApiModelProperty(value = "进项发票凭证数",required = true)
    private BigInteger input_invoice_voucher_cnt;
    @ApiModelProperty(value = "销项发票凭证数",required = true)
    private BigInteger output_invoice_voucher_cnt;
    @ApiModelProperty(value = "银行资金对账单数",required = true)
    private BigInteger bank_bill_cnt;
    @ApiModelProperty(value = "费用总额",required = true)
    private double fee_amt_total;
    @ApiModelProperty(value = "申报总金额",required = true)
    private double declare_amt_total;
    @ApiModelProperty(value = "个税申报人数",required = true)
    private BigInteger personal_declare_cnt;
    @ApiModelProperty(value = "个人所得税税款金额",required = true)
    private double person_tax_amt;
    @ApiModelProperty(value = "增值税税款金额",required = true)
    private double vat_amt;
    @ApiModelProperty(value = "附加税税款金额",required = true)
    private double add_tax_amt;
    @ApiModelProperty(value = "企业所得税税款金额",required = true)
    private double company_tax_amt;
    @ApiModelProperty(value = "其他税款",required = true)
    private double other_tax_amt;
    @ApiModelProperty(value = "其他税款剔除社保",required = true)
    private double other_tax_except_social_security;
}
