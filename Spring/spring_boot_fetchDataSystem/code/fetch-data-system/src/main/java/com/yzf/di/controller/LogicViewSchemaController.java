package com.yzf.di.controller;

import com.yzf.di.entity.po.FdsLogicViewMapping;
import com.yzf.di.entity.po.FdsLogicViewSchema;
import com.yzf.di.service.LogicViewSchemaService;
import com.yzf.di.util.Result;
import com.yzf.di.util.ResultGenerator;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Api(tags = {"逻辑视图-逻辑字段"})
@RestController
public class LogicViewSchemaController {
    @Autowired
    private LogicViewSchemaService logicViewSchemaService;
    @ApiOperation(value = "获取逻辑库表列表",notes = "分页")
    @GetMapping("/logic/view/schema/list")
    public Result<List<FdsLogicViewSchema>> list( @ApiParam(value = "页",defaultValue = "1") Integer page,  @ApiParam(value = "页大小",defaultValue = "10") Integer size){
        return ResultGenerator.getSuccessResult(logicViewSchemaService.list(page,size));
    }
    @ApiOperation(value = "搜索",notes = "分页")
    @PostMapping("/logic/view/schema/search")
    public Result<Page<FdsLogicViewSchema>> search(@RequestBody FdsLogicViewSchema fdsLogicViewSchema,  @RequestParam(value = "页",defaultValue = "1") Integer page,  @RequestParam(value = "页大小",defaultValue = "10") Integer size){
        Page<FdsLogicViewSchema> search = logicViewSchemaService.search(fdsLogicViewSchema,page,size);
        return ResultGenerator.getSuccessResult(search);
    }

    @ApiOperation(value = "导出execl",notes = "搜索后，导出execl")
    @PostMapping("/logic/view/schema/export")
    public Result<String> export(@RequestBody FdsLogicViewMapping fdsLogicViewMapping){
        return ResultGenerator.getSuccessResult("导出文件");
    }
    @ApiOperation(value = "刷新",notes = "点击刷新则在全局范围内重刷逻辑视图的字段，会运行一段时间。")
    @GetMapping("/logic/view/schema/refresh")
    public Result<String> automaticInit(){
        logicViewSchemaService.refresh();
        return ResultGenerator.getSuccessResult("成功");
    }

}
