package com.yck.springbootselflearning.controller;

import com.yck.springbootselflearning.dao.Stu;
import com.yck.springbootselflearning.service.impl.StuServiceImpl;
import com.yck.springbootselflearning.util.Result;
import com.yck.springbootselflearning.util.ResultGenerator;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.ws.rs.Path;

/**
 * @author ：yangchengkai@yunzhangfang.com
 * @description：TODO
 * @date ：2021/1/14 下午3:19
 */

@RestController
@Api(tags = {"基于HBase的学生表"})
public class StuController {

    @Autowired
    private StuServiceImpl stuService;

    @ApiOperation(value = "获取学生", notes = "基于HBase")
    @GetMapping("/stu/{id}")
    public Result<Stu> getStuById(@PathVariable @ApiParam(value = "学生id",defaultValue = "11001") String id){
        return ResultGenerator.getSuccessResult(stuService.getStuById(id));
    }
    @ApiOperation(value = "增加学生", notes = "")
    @PostMapping("/stu")
    public Result<Stu> getStuById(@RequestBody Stu stu){
        return ResultGenerator.getSuccessResult(stuService.saveStu(stu));
    }
    @ApiOperation(value = "删除学生", notes = "")
    @PostMapping("/stu/{id}")
    public Result<String> deleteStuById(@PathVariable @ApiParam(value = "学生id",defaultValue = "11001") String id){
        stuService.deleteStuById(id);
        return ResultGenerator.getSuccessResult("删除成功");
    }
}
