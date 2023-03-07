package com.yzf.raphael.model;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.math.BigInteger;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：9/24/20 2:56 PM
 */

@Data
@ApiModel(value = "企业简要信息", description = "多条件搜索、精确搜索、企业Card简要信息的返回格式")
public class CompanyBriefInfo {
    @ApiModelProperty(value = "云帐房企业id", required = true)
    private BigInteger qyid;
    @ApiModelProperty(value = "企业名称", required = true)
    private String qymc;
    @ApiModelProperty(value = "企业所属代帐公司id", required = true)
    private BigInteger gsid;
    @ApiModelProperty(value = "企业所属代帐公司名称", required = true)
    private String gsmc;
    @ApiModelProperty(value = "企业地址")
    private String dz;
//    @ApiModelProperty(value = "公司地区名称", required = true)
//    private String area_name;
    @ApiModelProperty(value = "企业省级名称", required = true)
    private String province_name;
    @ApiModelProperty(value = "企业市级名称", required = true)
    private String city_name;
    @ApiModelProperty(value = "企业县级名称", required = true)
    private String county_name;
    @ApiModelProperty(value = "帐套状态")
    private String zt;
    @ApiModelProperty(value = "所属行业")
    private String industry;
    @ApiModelProperty(value = "法定代表人")
    private String oper_name;
    @ApiModelProperty(value = "注册资本")
    private double zczb;
    @ApiModelProperty(value = "成立日期")
    private String start_date;
//    @ApiModelProperty(value = "联系电话")
//    private String tel;
    @ApiModelProperty(value = "结果分页 页面大小")
    private int page_size;
    @ApiModelProperty(value = "结果分页 页面id")
    private int page_id;
}
