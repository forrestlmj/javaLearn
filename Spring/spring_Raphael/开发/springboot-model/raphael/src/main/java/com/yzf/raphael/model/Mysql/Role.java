package com.yzf.raphael.model.Mysql;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：10/10/20 3:58 PM
 */

@Data
@ApiModel(value = "角色")
public class Role {
    @ApiModelProperty(value = "角色id", required = true)
    private Long id;
    @ApiModelProperty(value = "角色名称", required = true)
    private String name;
    public Role(Long id, String name){
        this.id = id;
        this.name = name;
    }
}
