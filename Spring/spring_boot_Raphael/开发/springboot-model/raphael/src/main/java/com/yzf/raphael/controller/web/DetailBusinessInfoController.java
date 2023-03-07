package com.yzf.raphael.controller.web;

import com.yzf.raphael.model.DwdCompanyBasicInfoD;
import com.yzf.raphael.model.Employ;
import com.yzf.raphael.model.Shareholder;
import com.yzf.raphael.services.impl.DetailBusinessInfoService;
import com.yzf.raphael.util.Result;
import com.yzf.raphael.util.ResultGenerator;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.math.BigInteger;
import java.util.List;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：9/24/20 11:58 AM
 */

@RestController
@RequestMapping("/detail/business_info")
@Api(tags = {"详情页-工商信息Tab页"})
public class DetailBusinessInfoController {
    @Resource
    private DetailBusinessInfoService detailBusinessInfoService;
    @ApiOperation(value = "基本信息表",
            notes = "基本信息表")
    @GetMapping("/basic_info")
    @ResponseBody
    public Result<DwdCompanyBasicInfoD> basic_info(@RequestParam @ApiParam(value = "企业id", defaultValue="714800799734497280") String qyid) {
        DwdCompanyBasicInfoD dwdCompanyBasicInfoD = detailBusinessInfoService.getReportBalanceByqyid(new BigInteger(qyid));
        return ResultGenerator.genSuccessResult(dwdCompanyBasicInfoD);
    }


    @ApiOperation(value = "高管信息表",
            notes = "高管信息接口")
    @GetMapping("/employ")
    @ResponseBody
    public Result<List<Employ>> employ(@RequestParam @ApiParam(value = "企业id", defaultValue="714800799734497280") String qyid) {
        List<Employ> employList = detailBusinessInfoService.getEmployByQyid(new BigInteger(qyid));
        return ResultGenerator.genSuccessResult(employList);
    }

    @ApiOperation(value = "股东信息表",
            notes = "股东信息接口")
    @GetMapping("/shareholder")
    @ResponseBody
    public Result<List<Shareholder>> shareholder(@RequestParam @ApiParam(value = "企业id", defaultValue="714800799734497280") String qyid) {
        List<Shareholder> shareholderList = detailBusinessInfoService.getShareholderByQyid(new BigInteger(qyid));
        return ResultGenerator.genSuccessResult(shareholderList);
    }
}
