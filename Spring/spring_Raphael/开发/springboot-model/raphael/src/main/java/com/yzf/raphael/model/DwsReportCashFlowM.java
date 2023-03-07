package com.yzf.raphael.model;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.math.BigInteger;

/**
 * @author ：xxx
 * @description：现金流量表
 * @date ：9/22/20 8:37 PM
 * 'set标签',
 * '会计年度',
 * '会计期间',
 * '报表类型（1资产负债）',
 * '指标值类型（1期末余额2年初余额）',
 * '企业
 * '企业名称',
 * '公司id',
 * '公司名称',
 * '地区代码',
 * '地区名称',
 * '销售产成品、商品、提供劳务收到的现金',
 * '收到的税费返还',
 * '收到的其他与经营活动有关的现金',
 * '经营活动现金流入小计',
 * '购买商品、接受劳务支付的现金',
 * '支付给职工以及为职工支付的现金',
 * '支付的各项税费',
 * '支付的其他与经营活动有关的现金',
 * '经营活动现金流出小计',
 * '经营活动产生的现金流量净额',
 * '收回投资收到的现金',
 * '取得投资收益收到的现金',
 * '处置固定资产、无形资产和其他长期资产收回的现金净额',
 * '处置子公司及其他营业单位收到的现金净额',
 * '收到其他与投资活动有关的现金',
 * '投资活动现金流入小计',
 * '购建固定资产、无形资产和其他长期资产所支付的现金',
 * '投资支付的现金',
 * '取得子公司及其他营业单位支付的现金净额',
 * '支付其他与投资活动有关的现金',
 * '投资活动现金流出小计',
 * '投资活动产生的现金流量净额',
 * '吸收投资收到的现金',
 * '取得借款收到的现金',
 * '收到其他与筹资活动有关的现金',
 * '筹资活动现金流入小计',
 * '偿还债务支付的现金',
 * '分配股利、利润或偿付利息支付的现金',
 * '支付其他与筹资活动有关的现金',
 * '筹资活动现金流出小计',
 * '筹资活动产生的现金流量净额',
 * '四、汇率变动对现金及现金等价物的影响',
 * '五、现金及现金等价物净增加额',
 * '加：期初现金及现金等价物余额',
 * '六、期末现金及现金等价物余额',
 */

@Data
@ApiModel(value="现金流量表", description="")
public class DwsReportCashFlowM {
    @ApiModelProperty(value = "set标签,", required = true)
    private String set_cd;
    @ApiModelProperty(value = "会计年度,", required = true)
    private int k_kjnd;
    @ApiModelProperty(value = "会计期间,", required = true)
    private int k_kjqj;
    @ApiModelProperty(value = "报表类型", hidden = true)
    private int report_type;
    @ApiModelProperty(value = "指标值类型 （1本期金额 2上期金额 3本月金额）,", hidden = true)
    private int index_type;
    @ApiModelProperty(value = "企业", required = true)
    private BigInteger qyid;
    @ApiModelProperty(value = "企业名称,", required = true)
    private String qymc;
    @ApiModelProperty(value = "公司id,", required = true)
    private BigInteger gsid;
    @ApiModelProperty(value = "公司名称,", required = true)
    private String gsmc;
    @ApiModelProperty(value = "地区代码,", required = true)
    private String area_code;
    @ApiModelProperty(value = "地区名称,", required = true)
    private String area_name;
    @ApiModelProperty(value = "销售产成品、商品、提供劳务收到的现金,", required = true)
    private double received_sale_or_service;
    @ApiModelProperty(value = "收到的税费返还,", required = true)
    private double received_refund_taxes;
    @ApiModelProperty(value = "收到的其他与经营活动有关的现金,", required = true)
    private double received_other_operation_act;
    @ApiModelProperty(value = "经营活动现金流入小计,", required = true)
    private double received_subtotal_operation_act;
    @ApiModelProperty(value = "购买商品、接受劳务支付的现金,", required = true)
    private double paid_buy_service_cash;
    @ApiModelProperty(value = "支付给职工以及为职工支付的现金,", required = true)
    private double paid_staff_cash;
    @ApiModelProperty(value = "支付的各项税费,", required = true)
    private double paid_taxes;
    @ApiModelProperty(value = "支付的其他与经营活动有关的现金,", required = true)
    private double paid_other_operation_act;
    @ApiModelProperty(value = "经营活动现金流出小计,", required = true)
    private double paid_subtotal_operation_act;
    @ApiModelProperty(value = "经营活动产生的现金流量净额,", required = true)
    private double net_operation_act_cash_flow;
    @ApiModelProperty(value = "收回投资收到的现金,", required = true)
    private double received_investments_cash;
    @ApiModelProperty(value = "取得投资收益收到的现金,", required = true)
    private double received_investments_income_cash;
    @ApiModelProperty(value = "处置固定资产、无形资产和其他长期资产收回的现金净额,", required = true)
    private double received_disposal_assets_cash;
    @ApiModelProperty(value = "处置子公司及其他营业单位收到的现金净额,", required = true)
    private double received_disposal_sub_units;
    @ApiModelProperty(value = "收到其他与投资活动有关的现金,", required = true)
    private double received_other_investments_cash;
    @ApiModelProperty(value = "投资活动现金流入小计,", required = true)
    private double received_subtotal_investments_cash;
    @ApiModelProperty(value = "购建固定资产、无形资产和其他长期资产所支付的现金,", required = true)
    private double paid_buy_assets_cash;
    @ApiModelProperty(value = "投资支付的现金,", required = true)
    private double paid_investments_cash;
    @ApiModelProperty(value = "取得子公司及其他营业单位支付的现金净额,", required = true)
    private double paid_sub_units;
    @ApiModelProperty(value = "支付其他与投资活动有关的现金,", required = true)
    private double paid_other_investments_cash;
    @ApiModelProperty(value = "投资活动现金流出小计,", required = true)
    private double paid_subtotal_investments_cash;
    @ApiModelProperty(value = "投资活动产生的现金流量净额,", required = true)
    private double net_investment_act_cash_flow;
    @ApiModelProperty(value = "吸收投资收到的现金,", required = true)
    private double received_absorb_investment_cash;
    @ApiModelProperty(value = "取得借款收到的现金,", required = true)
    private double received_borrow_cash;
    @ApiModelProperty(value = "收到其他与筹资活动有关的现金,", required = true)
    private double received_like_financial_cash;
    @ApiModelProperty(value = "筹资活动现金流入小计,", required = true)
    private double received_subtotal_financial_cash;
    @ApiModelProperty(value = "偿还债务支付的现金,", required = true)
    private double paid_borrow_cash;
    @ApiModelProperty(value = "分配股利、利润或偿付利息支付的现金,", required = true)
    private double paid_intr_cash;
    @ApiModelProperty(value = "支付其他与筹资活动有关的现金,", required = true)
    private double paid_like_financial_cash;
    @ApiModelProperty(value = "筹资活动现金流出小计,", required = true)
    private double paid_subtotal_financial_cash;
    @ApiModelProperty(value = "筹资活动产生的现金流量净额,", required = true)
    private double net_financial_act_cash_flow;
    @ApiModelProperty(value = "四、汇率变动对现金及现金等价物的影响,", required = true)
    private double exchange_rate_movement_cash_flow;
    @ApiModelProperty(value = "五、现金及现金等价物净增加额,", required = true)
    private double net_increase_cash_flow;
    @ApiModelProperty(value = "加：期初现金及现金等价物余额,", required = true)
    private double start_bal_cash_flow;
    @ApiModelProperty(value = "六、期末现金及现金等价物余额,", required = true)
    private double end_bal_cash_flow;

}
