package com.yzf.raphael.model;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Builder;
import lombok.Data;
import org.apache.ibatis.jdbc.Null;

import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * @author ：xxx
 * @description：
 * @date ：10/15/20 7:14 PM
 */

@Data
@ApiModel(value = "常见指标查询")
public class DwsFintechOftenIndexM {
    /**
     * 设置-1的原因是：
     * 保证在DwdCompanyBasicInfoDMapping.xml的mapper的select id="getCompanyBriefByMultiCondition"中，
     * 拼接后的sql语句的限制条件尽量保持最小
     */
    @ApiModelProperty(value = "注册时间 左",example = "2010-10-09")
    private String qy_zcrq_l;
    private static final SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");

    public DwsFintechOftenIndexM() {
    }

    @ApiModelProperty(value = "近一年营业收入 左",example = "0")
    private double recent_oneyear_operating_income_l = -1;
    @ApiModelProperty(value = "近一年净利润 左",example = "0")
    private double recent_oneyear_net_profit_l = -1;
    @ApiModelProperty(value = "近一年资产负债率 左",example = "0")
    private double recent_oneyear_alm_rate_l = -1;
    @ApiModelProperty(value = "近一年纳税总额 左",example = "0")
    private double recent_oneyear_all_tax_amt_l = -1;
    @ApiModelProperty(value = "近一年增值税纳税总额 左",example = "0")
    private double recent_oneyear_vat_amt_l = -1;
    @ApiModelProperty(value = "近一年有效开票总额 左",example = "0")
    private double recent_oneyear_valid_invoice_amt_l = -1;
    @ApiModelProperty(value = "近一年发票下游企业数 左",example = "0")
    private double recent_oneyear_down_qy_cnt_l = -1;
    @ApiModelProperty(value = "近6个月开票金额与上6个月环比 左",example = "0")
    private double recent_sixmonth_invoice_compare_l = -1;
    @ApiModelProperty(value = "近一年有效开票月份数 左",example = "0")
    private double recent_oneyear_valid_invoice_month_cnt_l = -1;
    @ApiModelProperty(value = "近一年红冲率 左",example = "0")
    private double recent_oneyear_red_rate_l = -1;
    @ApiModelProperty(value = "近一年有效发票数 左",example = "0")
    private double recent_oneyear_valid_invoice_cnt_l = -1;
    @ApiModelProperty(value = "近1年作废发票数量占比 左",example = "0")
    private double recent_oneyear_void_invoice_rate_l = -1;

    @ApiModelProperty(value = "注册时间 右", example = "2020-10-10")
    private String qy_zcrq_r;
    @ApiModelProperty(value = "近一年营业收入 右",example = "500000")
    private double recent_oneyear_operating_income_r = -1;
    @ApiModelProperty(value = "近一年净利润 右",example = "500000")
    private double recent_oneyear_net_profit_r = -1;
    @ApiModelProperty(value = "近一年资产负债率 右",example = "500000")
    private double recent_oneyear_alm_rate_r = -1;
    @ApiModelProperty(value = "近一年纳税总额 右",example = "500000")
    private double recent_oneyear_all_tax_amt_r = -1;
    @ApiModelProperty(value = "近一年增值税纳税总额 右",example = "500000")
    private double recent_oneyear_vat_amt_r = -1;
    @ApiModelProperty(value = "近一年有效开票总额 右",example = "500000")
    private double recent_oneyear_valid_invoice_amt_r = -1;
    @ApiModelProperty(value = "近一年发票下游企业数 右",example = "500000")
    private double recent_oneyear_down_qy_cnt_r = -1;
    @ApiModelProperty(value = "近6个月开票金额与上6个月环比 右",example = "1")
    private double recent_sixmonth_invoice_compare_r = -1;
    @ApiModelProperty(value = "近一年有效开票月份数 右",example = "500000")
    private double recent_oneyear_valid_invoice_month_cnt_r = -1;
    @ApiModelProperty(value = "近一年红冲率 右",example = "500000")
    private double recent_oneyear_red_rate_r = -1;
    @ApiModelProperty(value = "近一年有效发票数 右",example = "500000")
    private double recent_oneyear_valid_invoice_cnt_r = -1;
    @ApiModelProperty(value = "近1年作废发票数量占比 右",example = "1")
    private double recent_oneyear_void_invoice_rate_r = -1;



    @ApiModelProperty(value = "行业 ",example = "租赁业")
    private String industry;
    @ApiModelProperty(value = "地区 ",example = "410101")
    private String qy_dqbm;


    @ApiModelProperty(value = "结果分页 页面大小",example = "5")
    private int page_size = 5;
    @ApiModelProperty(value = "结果分页 页面id",example = "1")
    private int page_id = 1;
}
