package com.yzf.raphael.model;

import io.swagger.annotations.ApiModel;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：10/29/20 10:43 AM
 */

@Data
@ApiModel(value = "供应链关系图谱-返回格式")
public class EchartDataFormat {
    private List<EData> data;
    private List<ELink> links;
    public EchartDataFormat(){
        data = new ArrayList<>();
        links = new ArrayList<>();
    }
}

