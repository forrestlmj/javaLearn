package com.yzf.raphael.model;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import io.swagger.annotations.ApiParam;
import lombok.Data;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：10/19/20 4:57 PM
 */

@Data
@ApiModel(value = "下拉框中的行业选项")
public class Industry {
    @ApiModelProperty(value = "行业")
    private String industry;
}
