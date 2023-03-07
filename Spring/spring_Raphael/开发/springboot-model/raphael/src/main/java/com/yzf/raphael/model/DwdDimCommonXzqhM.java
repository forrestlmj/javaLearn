package com.yzf.raphael.model;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：10/19/20 5:39 PM
 */

@Data
@ApiModel(value = "地址树")
public class DwdDimCommonXzqhM {
    @ApiModelProperty(value = "层级",example = "0")
    private int type;
    @ApiModelProperty(value = "行政区划id",example = "32")
    private String k_xzqhid;
    @ApiModelProperty(value = "行政区划名称",example = "江苏省")
    private String k_xzqhmc;
    @ApiModelProperty(value = "上层行政区划id",example = "0")
    private String k_sjxzqhid;
}
