package com.yzf.di.controller;

import com.yzf.di.entity.dto.LogicViewDto;
import com.yzf.di.entity.po.FdsLogicViewMapping;
import com.yzf.di.util.Result;
import com.yzf.di.util.ResultGenerator;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@Api(tags = {"初始化"})
public class LogicViewInitController {
    @ApiOperation(value = "获取 初始化列表",notes = "分页")
    @GetMapping("/logic/view/init/list")
    public Result<List<LogicViewDto>> list(@ApiParam(value = "页",defaultValue = "1") Integer page, @ApiParam(value = "页大小",defaultValue = "10") Integer size){
        int a  = 1;
        return ResultGenerator.getSuccessResult(null);
    }
    @ApiOperation(value = "搜索",notes = "分页")
    @PostMapping("/logic/view/init/search")
    public Result<Page<LogicViewDto>> search(@RequestParam(value = "页",defaultValue = "1") Integer page, @RequestParam(value = "页大小",defaultValue = "10") Integer size, @RequestBody LogicViewDto logicViewDto){
//        Page<LogicViewDto> search = logicViewMappingService.search(logicViewDto,page,size);
        return ResultGenerator.getSuccessResult(null);
    }

    @ApiOperation(value = "导出execl",notes = "分页")
    @PostMapping("/logic/view/init/export")
    public Result<String> export(@RequestBody FdsLogicViewMapping fdsLogicViewMapping){
        return ResultGenerator.getSuccessResult("导出文件");
    }

}
