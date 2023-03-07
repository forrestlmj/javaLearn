package com.yzf.raphael.controller.web;

import com.yzf.raphael.dao.AreaNode;
import com.yzf.raphael.model.CompanyBriefInfo;
import com.yzf.raphael.model.DwsFintechOftenIndexM;
import com.yzf.raphael.model.Industry;
import com.yzf.raphael.services.impl.SearchService;
import com.yzf.raphael.util.Result;
import com.yzf.raphael.util.ResultGenerator;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：9/24/20 2:20 PM
 */

@RestController
@RequestMapping("/search")
@Api(tags = {"查询首页"})
public class SearchController {

    @Resource
    private SearchService searchService;

    @ApiOperation(value = "\"查一下\"搜索框",
            notes = "首页搜索框精准搜索。输入企业名称或云帐房企业id，作为搜索词进行搜索，返回企业列表")
    @GetMapping
    @ResponseBody
    public Result<List<CompanyBriefInfo>> getSearchResult(@RequestParam @ApiParam(value = "搜索词为企业名称或云帐房企业id（714800799734497280）",
            defaultValue = "苏州科伟达电子材料有限公司") String searchWord){
//        List<CompanyBriefInfo> l = searchService.getCompanyBriefInfoBySearchWord(searchWord);
        return ResultGenerator.genSuccessResult(searchService.getCompanyBriefInfoBySearchWord(searchWord));
    }



    @ApiOperation(value = "多条件搜索/获得行业列表",
            notes = "多条件搜索。获得行业列表")
    @GetMapping("/multi_condition/industry")
    @ResponseBody
    public Result<List<Industry>> getIndustry(
    ){
        return ResultGenerator.genSuccessResult(searchService.getIndustry());
    }



    @ApiOperation(value = "多条件搜索/迭代获得地区列表",
            notes = "多条件搜索。递归获得地区列表")
    @GetMapping("/multi_condition/area")
    @ResponseBody
    public Result<List<AreaNode>> getAreaNode(){

        return ResultGenerator.genSuccessResult(searchService.getAreaNode());
    }

    @ApiOperation(value = "多条件搜索",
            notes = "多条件搜索。输入地区、行业等上限与下限，获得公司列表")
    @PostMapping("/multi_condition")
    @ResponseBody
    public Result<List<CompanyBriefInfo>> getCompanyBriefByMultiCondition(
            @RequestBody DwsFintechOftenIndexM dwsFintechOftenIndexM
    ){
        return ResultGenerator.genSuccessResult(searchService.getCompanyBriefByMultiCondition(dwsFintechOftenIndexM));
    }
}
