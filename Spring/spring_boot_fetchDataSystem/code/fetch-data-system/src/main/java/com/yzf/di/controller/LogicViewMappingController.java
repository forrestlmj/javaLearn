package com.yzf.di.controller;

import com.yzf.di.entity.po.FdsLogicViewMapping;
import com.yzf.di.entity.dto.LogicViewDto;
import com.yzf.di.service.LogicViewMappingService;
import com.yzf.di.util.Result;
import com.yzf.di.util.ResultGenerator;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Api(tags = {"逻辑视图-逻辑库表"})
@RestController
public class LogicViewMappingController {
    @Autowired
    private LogicViewMappingService logicViewMappingService;
    @ApiOperation(value = "获取逻辑库表列表",notes = "分页")
    @GetMapping("/logic/view/mapping/list")
    public Result<List<LogicViewDto>> list( @ApiParam(value = "页",defaultValue = "1") Integer page, @ApiParam(value = "页大小",defaultValue = "10") Integer size){
        int a  = 1;
        return ResultGenerator.getSuccessResult(logicViewMappingService.list(page,size));
    }
    @ApiOperation(value = "搜索",notes = "分页")
    @PostMapping("/logic/view/mapping/search")
    public Result<Page<LogicViewDto>> search(@RequestParam(value = "页",defaultValue = "1") Integer page,  @RequestParam(value = "页大小",defaultValue = "10") Integer size,@RequestBody LogicViewDto logicViewDto){
        Page<LogicViewDto> search = logicViewMappingService.search(logicViewDto,page,size);
        return ResultGenerator.getSuccessResult(search);
    }

    @ApiOperation(value = "全局自动校验",notes = "分页")
    @GetMapping("/logic/view/mapping/init/automatic")
    public Result<String> automaticInit(){
        logicViewMappingService.automaticInit();
        return ResultGenerator.getSuccessResult("成功");
    }

    @ApiOperation(value = "新增文件校验",notes = "分页")
    @RequestMapping(value = "/logic/view/mapping/init/import",method = {RequestMethod.POST},headers = "content-type=multipart/form-data")
    public Result<String> initByFile(@ApiParam(value="文件",required=true) @RequestPart("file") MultipartFile file){
        logicViewMappingService.manualInitFromFile(file);
        return ResultGenerator.getSuccessResult("成功");
    }
    @ApiOperation(value = "导出execl",notes = "分页")
    @PostMapping("/logic/view/mapping/export")
    public Result<String> export(@RequestBody FdsLogicViewMapping fdsLogicViewMapping){
        return ResultGenerator.getSuccessResult("导出文件");
    }


}
