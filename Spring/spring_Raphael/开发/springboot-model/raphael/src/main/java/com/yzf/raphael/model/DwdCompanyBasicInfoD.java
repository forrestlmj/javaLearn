package com.yzf.raphael.model;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.math.BigInteger;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：9/24/20 11:06 AM
 * set标签
 * 企业id
 * 企业名称
 * 公司id
 * 公司名称
 * 公司类型
 * 账套代码
 * 账套名称
 * 纳税人资格代码
 * 信用等级
 * 登记注册类型代码
 * 经营范围
 * 企业注册日期
 * 企业地区代码
 * 企业地址
 * 注册资本
 * 实收资本
 * 社会统一信用代码
 * 法定代表人
 * 企业类型
 * 成立日期
 * 核准日期
 * 企业状态
 * 营业期限
 * 所属行业
 * 企业停用年份
 * 企业停用月份
 * 企业停用年月
 * 0停用
 * 企业类型名称
 * 公司地区代码
 * 公司地区名称
 * 省级名称
 * 市级名称
 * 县级名称
 * 公司状态：1-正常；2-冻结；3-删除
 * 代账公司注册日期
 * 财税分离类型
 * 产品类型：1-代账专业版、2-代账个人版、3-代账教育版
 * 创建时间
 * 会计核算准则
 * 账套启用会计年度
 * 账套启用会计期间
 * 账套代码状态
 * 账套创建时间
 */
@Data
@ApiModel(value="企业基本信息", description="")
public class DwdCompanyBasicInfoD implements Serializable {
//    @ApiModelProperty(value = "set标签")
//    private String set_cd;
    @ApiModelProperty(value = "云帐房企业id", required = true)
    private BigInteger qyid;
    @ApiModelProperty(value = "企业名称", required = true)
    private String qymc;
    @ApiModelProperty(value = "企业所属代帐公司id", required = true)
    private BigInteger gsid;
    @ApiModelProperty(value = "企业所属代帐公司名称", required = true)
    private String gsmc;
//    @ApiModelProperty(value = "公司类型")
//    private String gslx;
    @ApiModelProperty(value = "账套代码")
    private String k_ztdm;
    @ApiModelProperty(value = "账套名称")
    private String k_ztmc;
    @ApiModelProperty(value = "纳税人资格代码", required = true)
    private String nsrzgdm;
    @ApiModelProperty(value = "信用等级", required = true)
    private String nsrxydj;
    @ApiModelProperty(value = "登记注册类型代码")
    private String djzclx_dm;
    @ApiModelProperty(value = "经营范围", required = true)
    private String jsfw;
    @ApiModelProperty(value = "企业注册日期")
    private String qy_zcrq;
//    @ApiModelProperty(value = "企业地区代码")
//    private String qy_dqbm;
    @ApiModelProperty(value = "企业地址", required = true)
    private String dz;
    @ApiModelProperty(value = "注册资本", required = true)
    private double zczb;
    @ApiModelProperty(value = "实收资本", required = true)
    private double sszb;
    @ApiModelProperty(value = "社会统一信用代码", required = true)
    private String credit_code;
    @ApiModelProperty(value = "法定代表人", required = true)
    private String oper_name;
    @ApiModelProperty(value = "企业类型", required = true)
    private String econ_kind;
    @ApiModelProperty(value = "成立日期", required = true)
    private String start_date;
    @ApiModelProperty(value = "核准日期", required = true)
    private String check_date;
    @ApiModelProperty(value = "经营状态", required = true)
    private String status;
    @ApiModelProperty(value = "营业期限")
    private String business_term;
    @ApiModelProperty(value = "所属行业", required = true)
    private String industry;
//    @ApiModelProperty(value = "企业停用年份")
//    private BigInteger ty_kjnd;
//    @ApiModelProperty(value = "企业停用月份")
//    private BigInteger ty_kjqj;
//    @ApiModelProperty(value = "企业停用年月")
//    private String ty_kjndqj;
    @ApiModelProperty(value = "帐套是否停用")
    private String ty_zt;
//    @ApiModelProperty(value = "企业类型名称")
//    private String qylxmc;
//    @ApiModelProperty(value = "公司地区代码")
//    private String area_code;
//    @ApiModelProperty(value = "公司地区名称")
//    private String area_name;
    @ApiModelProperty(value = "企业省级名称")
    private String province_name;
    @ApiModelProperty(value = "企业市级名称")
    private String city_name;
    @ApiModelProperty(value = "企业县级名称")
    private String county_name;
    @ApiModelProperty(value = "公司状态")
    private String zt;
//    @ApiModelProperty(value = "代账公司注册日期")
//    private String dzgs_zcrq;
    @ApiModelProperty(value = "财税分离类型")
    private String csfl_type;
    @ApiModelProperty(value = "产品类型")
    private String product_type;
    @ApiModelProperty(value = "创建时间")
    private String dzgs_create_time;
//    @ApiModelProperty(value = "会计核算准则")
//    private String k_kjhszzid;
    @ApiModelProperty(value = "账套启用会计年度")
    private BigInteger k_qykjnd;
    @ApiModelProperty(value = "账套启用会计期间")
    private BigInteger k_qykjqj;
    @ApiModelProperty(value = "账套代码状态")
    private String k_ztqybz;
    @ApiModelProperty(value = "账套创建时间")
    private String k_creatr_data;

}
