package com.forrestlmj.businessportraits.controller;

import com.forrestlmj.businessportraits.dao.BaseShareholderInfo;
import com.forrestlmj.businessportraits.service.BaseShareHolderInfoService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@Api(tags = {"股东信息接口"})
@RestController()
public class BaseShareHolderInfoController {
    @Autowired
    private BaseShareHolderInfoService baseShareHolderInfoService;

    @GetMapping("/shareholder/{id}")
    @ApiOperation(value = "获取股东id",notes = "获取")
    public BaseShareholderInfo getById(@PathVariable @ApiParam(value = "股东id", defaultValue = "1") Integer id){
        return baseShareHolderInfoService.getById(id);
    }

    @PostMapping("/sharehodler")
    @ApiOperation(value = "增加股东")
    public BaseShareholderInfo addShareholder(@RequestBody BaseShareholderInfo baseShareholderInfo){
        return baseShareHolderInfoService.save(baseShareholderInfo);
    }
    @PutMapping("/sharehodler")
    @ApiOperation(value = "增加股东")
    public BaseShareholderInfo updateShareholder(@RequestBody BaseShareholderInfo baseShareholderInfo){
        return baseShareHolderInfoService.save(baseShareholderInfo);
    }
    @DeleteMapping("/shareholder/{id}")
    @ApiOperation(value = "删除股东")
    public void deleteShareholder(@PathVariable @ApiParam(value = "股东id", defaultValue = "1") Integer id){
        baseShareHolderInfoService.delete(id);
    }

}
