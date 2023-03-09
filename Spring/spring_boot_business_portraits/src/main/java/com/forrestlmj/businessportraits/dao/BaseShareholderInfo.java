package com.forrestlmj.businessportraits.dao;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import io.swagger.annotations.ApiOperation;
import lombok.Data;

import javax.persistence.*;

@Table
@Entity
@Data
@ApiModel("企业的股东信息")
public class BaseShareholderInfo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @ApiModelProperty(value = "公司编号")
    private String companyUnique;
    @ApiModelProperty(value = "股东编号")
    private String shareholderUnique;
    @ApiModelProperty(value = "股东名称")
    private String Shareholder;
    @ApiModelProperty(value = "持股比例")
    private String shareholdingRatio;
    @ApiModelProperty(value = "出资金额")
    private String subscriptionAmount;
    @ApiModelProperty(value = "出资日期")
    private String fundingDate;
    @ApiModelProperty(value = "")
    private String createdTime;
}
