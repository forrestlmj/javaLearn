package com.yzf.di.controller;

import com.yzf.di.entity.po.FdsMysqlDataDict;
import com.yzf.di.service.MysqlDataDictService;
import com.yzf.di.util.Result;
import com.yzf.di.util.ResultGenerator;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.*;

@Api(tags = {"Mysql数据字典"})
@RestController
public class MysqlDataDictController {
    @Autowired
    private MysqlDataDictService mysqlDataDiceService;
    @ApiOperation(value = "获取Mysql 数据字典 源表列表",notes = "分页")
    @GetMapping("/mysql/dict/list")
    public Result<Page<FdsMysqlDataDict>> list( @ApiParam(value = "页",defaultValue = "1") Integer page,  @ApiParam(value = "页大小",defaultValue = "10") Integer size){
        return ResultGenerator.getSuccessResult(mysqlDataDiceService.list(page,size));
    }
    @ApiOperation(value = "获取Mysql 数据字典 源表列表",notes = "分页")
    @PostMapping("/mysql/dict/search")
    public Result<Page<FdsMysqlDataDict>> search(@RequestBody FdsMysqlDataDict searchDao,  @ApiParam(value = "页",defaultValue = "1") Integer page,  @ApiParam(value = "页大小",defaultValue = "10") Integer size){
        return ResultGenerator.getSuccessResult(mysqlDataDiceService.search(searchDao,page,size));
    }
    @ApiOperation(value = "导出execl",notes = "分页")
    @PostMapping("/mysql/dict/export")
    public Result<String> export(@RequestBody FdsMysqlDataDict fdsMysqlDataDict){
        return ResultGenerator.getSuccessResult("导出文件");
    }


}
