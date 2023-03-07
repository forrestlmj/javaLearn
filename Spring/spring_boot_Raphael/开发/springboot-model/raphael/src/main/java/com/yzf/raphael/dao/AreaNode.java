package com.yzf.raphael.dao;

import com.yzf.raphael.model.DwdDimCommonXzqhM;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.List;
import java.util.Map;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：11/5/20 2:05 PM
 */

@Data
@ApiModel(value = "地址树节点")
public class AreaNode {
    @ApiModelProperty(value = "上层企业地区编码id")
    private String qy_dqbm_f;

    @ApiModelProperty(value = "企业地区编码id")
    private String value;
    @ApiModelProperty(value = "企业地区名称",example = "江苏省")
    private String label;
    @ApiModelProperty(value = "该地址树的子节点")
    private List<AreaNode> children;
    public AreaNode(String qy_dqbm_f,String qy_dqbm,String qy_dqmc){
        this.qy_dqbm_f = qy_dqbm_f;
        this.value = qy_dqbm;
        this.label = qy_dqmc;
    }
    public AreaNode(){

    }
}
