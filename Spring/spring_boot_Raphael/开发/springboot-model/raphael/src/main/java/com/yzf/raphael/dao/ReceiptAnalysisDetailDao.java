package com.yzf.raphael.dao;

import com.yzf.raphael.model.ReceiptAnalysisDetail;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.List;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：11/12/20 3:04 PM
 */

@Data
@ApiModel(value = "月度等发票前端接口类")
public class ReceiptAnalysisDetailDao {
    @ApiModelProperty(value = "年")
    private String year;

    public ReceiptAnalysisDetailDao(String year, List<ReceiptAnalysisDetail> month) {
        this.year = year;
        this.month = month;
    }

    @ApiModelProperty(value = "该年下每个月的发票情况")
    private List<ReceiptAnalysisDetail> month;
}
