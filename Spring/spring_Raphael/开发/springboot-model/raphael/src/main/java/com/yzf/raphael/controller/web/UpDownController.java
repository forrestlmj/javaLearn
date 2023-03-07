package com.yzf.raphael.controller.web;

import com.yzf.raphael.model.EchartDataFormat;
import com.yzf.raphael.services.impl.UpDownService;
import com.yzf.raphael.util.Result;
import com.yzf.raphael.util.ResultGenerator;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：10/20/20 8:20 PM
 */

@RestController
@RequestMapping(value = "/detail/graph")
@Api(tags = {"详情页-经营分析Tab页-供应链关系图谱"})
public class UpDownController {

    @Autowired
    private UpDownService upDownService;
    @ApiOperation(value = "上下游图谱",
        notes = "返回上两层、下两层上下游关系")
    @GetMapping(value = "/updown")
    @ResponseBody
    public Result<EchartDataFormat> getUpAndDown(@RequestParam @ApiParam(value = "企业名称", defaultValue = "苏州科伟达电子材料有限公司") String qymc){
        return ResultGenerator.genSuccessResult(upDownService.getUpAndDown(qymc));
    }

    @ApiOperation(value = "上游图谱",
            notes = "返回上游5层关系")
    @GetMapping(value = "/up")
    @ResponseBody
    public Result<EchartDataFormat> getUp(@RequestParam @ApiParam(value = "企业名称", defaultValue = "苏州科伟达电子材料有限公司") String qymc){
        return ResultGenerator.genSuccessResult(upDownService.getUp(qymc));
    }

    @ApiOperation(value = "下游图谱",
            notes = "返回下游5层关系")
    @GetMapping(value = "/down")
    @ResponseBody
    public Result<EchartDataFormat> getDown(@RequestParam @ApiParam(value = "企业名称", defaultValue = "苏州科伟达电子材料有限公司") String qymc){
        return ResultGenerator.genSuccessResult(upDownService.getDown(qymc));
    }
}
