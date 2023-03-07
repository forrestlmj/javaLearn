package com.yzf.raphael.model;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.math.BigInteger;

/**
 * @author ：xxx
 * @description：利润表
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
 * '一、营业收入',
 * '减：营业成本',
 * '营业税金及附加',
 * '销售费用',
 * '管理费用',
 * '财务费用',
 * '资产减值损失',
 * '加：公允价值变动收益（损失以"-"号填列）',
 * '投资收益（损失以"-"号填列）',
 * '其中：对联营企业和合营企业的投资收益',
 * '二、营业利润（亏损以-号填列）',
 * '加：营业外收入',
 * '其中:非流动资产处置利得',
 * '减：营业外支出',
 * '其中：非流动资产处置损失',
 * '三、利润总额（亏损总额以-号填列）',
 * '减：所得税费用',
 * '四、净利润（净亏损以-号填列）',
 * '五、其他综合收益的税后净额',
 * '（一）以后不能重分类进损益的其他综合收益',
 * '1.重新计量设定收益计划净负债或净资产的变动',
 * '2.权益法下在被投资单位不能重分类进损益的其他综合收益中享有的份额',
 * '（二）以后将重分类进损益的其他综合收益',
 * '1.权益法下在被投资单位以后将重分类进损益的其他综合收益中享有的份额',
 * '2.可供出售金融资产公允价值变动损益',
 * '3.将有至到期投资重分类可供出售金融资产损益',
 * '4.现金流经套期损益的有效部分',
 * '5.外币财务报表折算差额',
 * '六、综合收益总额',
 * '七、每股收益:',
 * '(一)基本每股收益',
 * '(二)稀释每股收益',
 */

@Data
@ApiModel(value="利润表", description="")
public class DwsReportProfitM {
    @ApiModelProperty(value = "set标签", required = true)
    private String set_cd;
    @ApiModelProperty(value = "会计年度", required = true)
    private int k_kjnd;
    @ApiModelProperty(value = "会计期间", required = true)
    private int k_kjqj;
    @ApiModelProperty(value = "报表类型", hidden = true)
    private int report_type;
    @ApiModelProperty(value = "指标值类型（1本期金额 2上期金额 3本月金额）", hidden = true)
    private int index_type;
    @ApiModelProperty(value = "企业", required = true)
    private BigInteger qyid;
    @ApiModelProperty(value = "企业名称", required = true)
    private String qymc;
    @ApiModelProperty(value = "公司id", required = true)
    private BigInteger gsid;
    @ApiModelProperty(value = "公司名称", required = true)
    private String gsmc;
    @ApiModelProperty(value = "地区代码", required = true)
    private String area_code;
    @ApiModelProperty(value = "地区名称", required = true)
    private String area_name;
    @ApiModelProperty(value = "一、营业收入", required = true)
    private double operating_income;
    @ApiModelProperty(value = "减：营业成本", required = true)
    private double less_operating_costs;
    @ApiModelProperty(value = "营业税金及附加", required = true)
    private double business_tax_and_surcharges;
    @ApiModelProperty(value = "销售费用", required = true)
    private double sale_costs;
    @ApiModelProperty(value = "管理费用", required = true)
    private double manage_costs;
    @ApiModelProperty(value = "财务费用", required = true)
    private double finance_costs;
    @ApiModelProperty(value = "资产减值损失", required = true)
    private double assets_impairment_loss;
    @ApiModelProperty(value = "加：公允价值变动收益（损失以'-'号填列）", required = true)
    private double plus_income_changes_in_fair_value;
    @ApiModelProperty(value = "投资收益（损失以'-'号填列）", required = true)
    private double investment_income;
    @ApiModelProperty(value = "其中：对联营企业和合营企业的投资收益", required = true)
    private double includ_investment_income_joint_ventures;
    @ApiModelProperty(value = "二、营业利润（亏损以-号填列）", required = true)
    private double operating_profit;
    @ApiModelProperty(value = "加：营业外收入", required = true)
    private double plus_non_operating_income;
    @ApiModelProperty(value = "其中:非流动资产处置利得", required = true)
    private double includ_gains_disposal;
    @ApiModelProperty(value = "减：营业外支出", required = true)
    private double less_non_operating_expenses;
    @ApiModelProperty(value = "其中：非流动资产处置损失", required = true)
    private double includ_loss_on_disposal;
    @ApiModelProperty(value = "三、利润总额（亏损总额以-号填列）", required = true)
    private double profit_total;
    @ApiModelProperty(value = "减：所得税费用", required = true)
    private double less_tax_costs;
    @ApiModelProperty(value = "四、净利润（净亏损以-号填列）", required = true)
    private double net_profit;
    @ApiModelProperty(value = "五、其他综合收益的税后净额", required = true)
    private double other_comprehensive_profit;
    @ApiModelProperty(value = "（一）以后不能重分类进损益的其他综合收益", required = true)
    private double other_comprehensive_profit_1;
    @ApiModelProperty(value = "1.重新计量设定收益计划净负债或净资产的变动", required = true)
    private double other_comprehensive_profit_11;
    @ApiModelProperty(value = "2.权益法下在被投资单位不能重分类进损益的其他综合收益中享有的份额", required = true)
    private double other_comprehensive_profit_12;
    @ApiModelProperty(value = "（二）以后将重分类进损益的其他综合收益", required = true)
    private double other_comprehensive_profit_2;
    @ApiModelProperty(value = "1.权益法下在被投资单位以后将重分类进损益的其他综合收益中享有的份额", required = true)
    private double other_comprehensive_profit_21;
    @ApiModelProperty(value = "2.可供出售金融资产公允价值变动损益", required = true)
    private double other_comprehensive_profit_22;
    @ApiModelProperty(value = "3.将有至到期投资重分类可供出售金融资产损益", required = true)
    private double other_comprehensive_profit_23;
    @ApiModelProperty(value = "4.现金流经套期损益的有效部分", required = true)
    private double other_comprehensive_profit_24;
    @ApiModelProperty(value = "5.外币财务报表折算差额", required = true)
    private double other_comprehensive_profit_25;
    @ApiModelProperty(value = "六、综合收益总额", required = true)
    private double comprehensive_profit_total;
    @ApiModelProperty(value = "七、每股收益:", required = true)
    private double per_share_profit;
    @ApiModelProperty(value = "(一)基本每股收益", required = true)
    private double basic_per_share_profit;
    @ApiModelProperty(value = "(二)稀释每股收益", required = true)
    private double dilution_per_share_profit;
}
