package com.yck.springbootselflearning.controller;

import com.yck.springbootselflearning.dao.Employee;
import com.yck.springbootselflearning.config.PersonConfig;
import com.yck.springbootselflearning.service.EmployeeService;
import com.yck.springbootselflearning.util.Result;
import com.yck.springbootselflearning.util.ResultGenerator;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * @author ：forrestlmj@github.com
 * @description：TODO
 * @date ：2021/1/1 下午12:55
 */
@Api(tags = {"员工模块"})
@RestController
public class EmployeeController {
    @Autowired
    private PersonConfig personConfig;

    @Resource
    private EmployeeService employeeService;
    @ApiOperation(value = "根据员工id获得员工",notes = "这个接口的一些说明")
    @GetMapping("/employ/{id}")
    public Result<Employee> getEmpById(@PathVariable @ApiParam(value = "员工id", defaultValue = "1") Integer id){
        System.out.println(personConfig.toString());
        return ResultGenerator.getSuccessResult(employeeService.getEmpById(id));
    }

    @ApiOperation(value = "增加员工",notes = "这个接口的一些说明")
    @PostMapping("/employ")
    public Result<Employee> addEmp(@RequestBody Employee employee){
        return ResultGenerator.getSuccessResult(employeeService.saveEmp(employee));
    }
    @ApiOperation(value = "修改员工",notes = "这个接口的一些说明")
    @PutMapping("/employ")
    public Result<Employee> updateEmp(@RequestBody Employee employee){
        return ResultGenerator.getSuccessResult(employeeService.saveEmp(employee));
    }
    @ApiOperation(value = "删除员工",notes = "这个接口的一些说明")
    @DeleteMapping("/employ/{id}")
    public Result<String> deleteEmp(@PathVariable @ApiParam(value = "员工id", defaultValue = "1") Integer id){
        employeeService.deleteEmpById(id);
        return ResultGenerator.getSuccessResult("删除成功");
    }
}
