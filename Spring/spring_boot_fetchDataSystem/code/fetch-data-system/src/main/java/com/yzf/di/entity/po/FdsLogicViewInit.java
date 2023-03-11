package com.yzf.di.entity.po;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import javax.persistence.*;

@Table(indexes = {@Index(name = "idx_init_type_name",columnList = "initType,initName")})
@ApiModel(value = "逻辑视图初始化")
@Entity
public class FdsLogicViewInit {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @ApiModelProperty(value = "id")
    private Integer id;
    @Column(length = 40)
    @ApiModelProperty(value = "逻辑库")
    private String logicDatabase;
    @Column(length = 100)
    @ApiModelProperty(value = "逻辑表")
    private String logicTable;
    @Column(length = 140)
    @ApiModelProperty(value = "初始化名称")
    private String initName;
    @Column(length = 10)
    @ApiModelProperty(value = "初始化类型")
    private String initType;

}
