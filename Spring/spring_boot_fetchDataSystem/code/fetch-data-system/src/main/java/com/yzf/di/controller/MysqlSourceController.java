package com.yzf.di.controller;

import com.yzf.di.entity.FdsMysqlSource;
import com.yzf.di.service.MysqlDataDictService;
import com.yzf.di.service.MysqlSourceService;
import com.yzf.di.util.Result;
import com.yzf.di.util.ResultGenerator;
import io.swagger.annotations.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.*;

/**
 *
 */
@Api(tags = {"Mysql源表"})
@RestController
@ApiResponses(
        {
                @ApiResponse(code = 200,message = "操作成功"),
                @ApiResponse(code = 401,message = "认证失败"),
                @ApiResponse(code = 403,message = "禁止当前操作"),
                @ApiResponse(code = 404,message = "接口不存在"),
                @ApiResponse(code = 500,message = "服务器内部错误"),
        })
public class MysqlSourceController {
    @Autowired
    private MysqlSourceService mysqlSourceService;

    @Autowired
    private MysqlDataDictService mysqlDataDiceService;
    @ApiOperation(value = "获取Mysql源表列表",notes = "分页")
    @GetMapping("/mysql/source/list")
    public Result<Page<FdsMysqlSource>> list(@ApiParam(value = "页",defaultValue = "1") Integer page, @ApiParam(value = "页大小",defaultValue = "10") Integer size){
        return ResultGenerator.getSuccessResult(mysqlSourceService.list(page,size));
    }
    @GetMapping("/mysql/source/{id}")
    public Result<FdsMysqlSource> getById(@PathVariable @ApiParam(value = "数据库源id") Integer id){
        return ResultGenerator.getSuccessResult(mysqlSourceService.getById(id));
    }
    @DeleteMapping("/mysql/source/{id}")
    public Result deleteById(@PathVariable @ApiParam(value = "数据库源id") Integer id){
        // TODO 级联删除其他表中这个mysql相关的数据。
        try {
            mysqlSourceService.deleteById(id);
        }catch (EmptyResultDataAccessException e) {
            return ResultGenerator.getForbiddenResult("不存在mysql链接，删除失败");
        }
        return ResultGenerator.getSuccessResult("删除成功");
    }
    @PostMapping("/mysql/source")
    @ApiOperation(value = "添加mysql数据源",notes = "用户点击保存时候，会先校验连接时否有效，如果无效则提示，否则添加成功")
    @ApiResponses(
            value = {
                    @ApiResponse(code = 498,message = "无法连接mysql数据库,请检查链接用户名是否正确"),
                    @ApiResponse(code = 499,message = "已添加当前ysql数据库,请勿重复添加")
            }
    )
    public Result<String> addOrUpdate(@RequestBody FdsMysqlSource fdsMysqlSource){
        // TODO 498 499
            if (mysqlSourceService.addOrUpdate(fdsMysqlSource))
                return ResultGenerator.getSuccessResult("添加成功");
            return ResultGenerator.getForbiddenResult("无法连接mysql数据库,请检查链接用户名是否正确");

    }
    @PostMapping("/mysql/fetch")
    @ApiOperation(value = "同步mysql数据源",notes = "")
    @ApiResponses(
            value = {
                    @ApiResponse(code = 497,message = "同步失败")
            }
    )
    public Result<String> fetch(@RequestBody FdsMysqlSource fdsMysqlSource) {
        if (mysqlDataDiceService.fetch(fdsMysqlSource))
            return ResultGenerator.getSuccessResult("同步成功");
        return ResultGenerator.getFailResult("同步失败");

    }
}
