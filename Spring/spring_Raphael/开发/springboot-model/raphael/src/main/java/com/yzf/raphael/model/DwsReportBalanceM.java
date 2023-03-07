package com.yzf.raphael.model;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.math.BigInteger;

/**
 * @author ：xxx
 * @description：资产负债表
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
 * '货币资金',
 * '以公允价值计量且其变动计入当期损益的金融资产',
 * '应收票据',
 * '应收帐款',
 * '预付款项',
 * '应收利息',
 * '应收股利',
 * '其他应收款',
 * '存货',
 * '一年内到期的非流动资产',
 * '其他流动资产',
 * '流动资产合计',
 * '可供出售金融资产',
 * '持有至到期投资',
 * '长期应收款',
 * '长期股权投资',
 * '投资性房地产',
 * '固定资产',
 * '在建工程',
 * '工程物资',
 * '固定资产清理',
 * '生产性生物资产',
 * '油气资产',
 * '无形资产',
 * '开发支出',
 * '商誉',
 * '长期待摊费用',
 * '递延所得税资产',
 * '其他非流动资产',
 * '非流动资产合计',
 * '资产总计',
 * '短期借款',
 * '交易性金融负债',
 * '应付票据',
 * '应付账款',
 * '预收款项',
 * '应付职工薪酬',
 * '应交税费',
 * '应付利息',
 * '应付股利',
 * '其他应付款',
 * '一年内到期的非流动负债',
 * '其他流动负债',
 * '流动负债合计',
 * '长期借款',
 * '应付债券',
 * '长期应付款',
 * '专项应付款',
 * '预计负债',
 * '递延收益',
 * '递延所得税负债',
 * '其他非流动负债',
 * '非流动负债合计',
 * '负债合计',
 * '实收资本（或股本）',
 * '资本公积',
 * '减：库存股',
 * '专项储备',
 * '盈余公积',
 * '未分配利润',
 * '所有者权益（或股东权益）合计',
 * '负债和所有者权益（或股东权益）合计',
 */

@Data
@ApiModel(value="资产负债表", description="")
public class DwsReportBalanceM {
    @ApiModelProperty(value = "set标签", required = true)
    private String set_cd ;
    @ApiModelProperty(value = "会计年度", required = true)
    private int k_kjnd ;
    @ApiModelProperty(value = "会计期间", required = true)
    private int k_kjqj ;
    @ApiModelProperty(value = "报表类型", hidden = true)
    private int report_type ;
    @ApiModelProperty(value = "指标值类型 （1期末余额 2年初余额）,", hidden = true)
    private int index_type ;
    @ApiModelProperty(value = "企业", required = true)
    private BigInteger qyid ;
    @ApiModelProperty(value = "企业名称", required = true)
    private String qymc ;
    @ApiModelProperty(value = "公司id", required = true)
    private BigInteger gsid ;
    @ApiModelProperty(value = "公司名称", required = true)
    private String gsmc ;
    @ApiModelProperty(value = "地区代码", required = true)
    private String area_code ;
    @ApiModelProperty(value = "地区名称", required = true)
    private String area_name ;
    @ApiModelProperty(value = "货币资金", required = true)
    private double currency_fund ;
    @ApiModelProperty(value = "以公允价值计量且其变动计入当期损益的金融资产", required = true)
    private double financial_assets ;
    @ApiModelProperty(value = "应收票据", required = true)
    private double receivable_bill ;
    @ApiModelProperty(value = "应收帐款", required = true)
    private double receivable_accounts ;
    @ApiModelProperty(value = "预付款项", required = true)
    private double advance_payment ;
    @ApiModelProperty(value = "应收利息", required = true)
    private double receivable_interest ;
    @ApiModelProperty(value = "应收股利", required = true)
    private double receivable_dividend ;
    @ApiModelProperty(value = "其他应收款", required = true)
    private double other_receivable_payment ;
    @ApiModelProperty(value = "存货", required = true)
    private double stock ;
    @ApiModelProperty(value = "一年内到期的非流动资产", required = true)
    private double one_year_expire_un_flow_assets ;
    @ApiModelProperty(value = "其他流动资产", required = true)
    private double other_flow_assets ;
    @ApiModelProperty(value = "流动资产合计", required = true)
    private double flow_assets_total ;
    @ApiModelProperty(value = "可供出售金融资产", required = true)
    private double available_for_sale_financial_assets ;
    @ApiModelProperty(value = "持有至到期投资", required = true)
    private double held_to_maturity_investment ;
    @ApiModelProperty(value = "长期应收款", required = true)
    private double long_term_receivables ;
    @ApiModelProperty(value = "长期股权投资", required = true)
    private double long_term_equity_investment ;
    @ApiModelProperty(value = "投资性房地产", required = true)
    private double investment_real_estate ;
    @ApiModelProperty(value = "固定资产", required = true)
    private double fixed_assets ;
    @ApiModelProperty(value = "在建工程", required = true)
    private double construction_in_progress ;
    @ApiModelProperty(value = "工程物资", required = true)
    private double engineering_materials ;
    @ApiModelProperty(value = "固定资产清理", required = true)
    private double liquidation_of_fixed_assets ;
    @ApiModelProperty(value = "生产性生物资产", required = true)
    private double productive_biological_assets ;
    @ApiModelProperty(value = "油气资产", required = true)
    private double oil_gas_assets ;
    @ApiModelProperty(value = "无形资产", required = true)
    private double intangible_assets ;
    @ApiModelProperty(value = "开发支出", required = true)
    private double development_expenditure ;
    @ApiModelProperty(value = "商誉", required = true)
    private double goodwill ;
    @ApiModelProperty(value = "长期待摊费用", required = true)
    private double long_term_deferred_expenses ;
    @ApiModelProperty(value = "递延所得税资产", required = true)
    private double deferred_tax_assets ;
    @ApiModelProperty(value = "其他非流动资产", required = true)
    private double other_un_flow_assets ;
    @ApiModelProperty(value = "非流动资产合计", required = true)
    private double un_flow_assets_total ;
    @ApiModelProperty(value = "资产总计", required = true)
    private double assets_total ;
    @ApiModelProperty(value = "短期借款", required = true)
    private double short_term_loan ;
    @ApiModelProperty(value = "交易性金融负债", required = true)
    private double trading_financial_liabilities ;
    @ApiModelProperty(value = "应付票据", required = true)
    private double payable_bill ;
    @ApiModelProperty(value = "应付账款", required = true)
    private double payable_accounts ;
    @ApiModelProperty(value = "预收款项", required = true)
    private double collect_payment ;
    @ApiModelProperty(value = "应付职工薪酬", required = true)
    private double payable_employee_compensation ;
    @ApiModelProperty(value = "应交税费", required = true)
    private double due_tax ;
    @ApiModelProperty(value = "应付利息", required = true)
    private double payable_interest ;
    @ApiModelProperty(value = "应付股利", required = true)
    private double payable_dividend ;
    @ApiModelProperty(value = "其他应付款", required = true)
    private double other_payable_payment ;
    @ApiModelProperty(value = "一年内到期的非流动负债", required = true)
    private double one_year_expire_un_flow_debts ;
    @ApiModelProperty(value = "其他流动负债", required = true)
    private double other_flow_debts ;
    @ApiModelProperty(value = "流动负债合计", required = true)
    private double flow_debts_total ;
    @ApiModelProperty(value = "长期借款", required = true)
    private double long_term_loan ;
    @ApiModelProperty(value = "应付债券", required = true)
    private double payable_bond ;
    @ApiModelProperty(value = "长期应付款", required = true)
    private double long_term_payable ;
    @ApiModelProperty(value = "专项应付款", required = true)
    private double special_payable ;
    @ApiModelProperty(value = "预计负债", required = true)
    private double estimate_debts ;
    @ApiModelProperty(value = "递延收益", required = true)
    private double deferred_income ;
    @ApiModelProperty(value = "递延所得税负债", required = true)
    private double deferred_tax_debts ;
    @ApiModelProperty(value = "其他非流动负债", required = true)
    private double other_un_flow_debts ;
    @ApiModelProperty(value = "非流动负债合计", required = true)
    private double un_flow_debts_total ;
    @ApiModelProperty(value = "负债合计", required = true)
    private double debts_total ;
    @ApiModelProperty(value = "实收资本（或股本）", required = true)
    private double paid_in_capital ;
    @ApiModelProperty(value = "资本公积", required = true)
    private double capital_reserve ;
    @ApiModelProperty(value = "减：库存股", required = true)
    private double less_treasury_stock ;
    @ApiModelProperty(value = "专项储备", required = true)
    private double special_reserve ;
    @ApiModelProperty(value = "盈余公积", required = true)
    private double surplus_reserve ;
    @ApiModelProperty(value = "未分配利润", required = true)
    private double undistributed_profit ;
    @ApiModelProperty(value = "所有者权益（或股东权益）合计", required = true)
    private double owner_rights_total ;
    @ApiModelProperty(value = "负债和所有者权益（或股东权益）合计", required = true)
    private double debts_owner_rights_total ;
}
