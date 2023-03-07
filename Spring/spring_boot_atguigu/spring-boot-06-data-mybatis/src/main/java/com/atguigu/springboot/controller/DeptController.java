package com.atguigu.springboot.controller;

import com.atguigu.springboot.bean.Department;
import com.atguigu.springboot.bean.Employee;
import com.atguigu.springboot.mapper.DepartmentMapper;
import com.atguigu.springboot.mapper.EmployeeMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：2020/12/31 下午2:30
 */

@RestController
public class DeptController {
    Logger logger = LoggerFactory.getLogger(DeptController.class.getName());
    @Resource
    private DepartmentMapper departmentMapper;

    @Resource
    private EmployeeMapper employeeMapper;

    @GetMapping("/dept/{id}")
    public Department getDept(@PathVariable("id") Integer id){
        return departmentMapper.getDeptById(id);
    }
    @DeleteMapping("/dept/{id}")
    public int delDept(@PathVariable("id") Integer id){
        logger.info(departmentMapper.getDeptById(id).toString()+"已经删除");
        return departmentMapper.deleteDeptById(id);
    }

    @GetMapping("/dept")
    @Transactional
    public Department addDept(Department department){
        departmentMapper.insertDept(department);
        logger.info(department.toString());
        return department;
    }

    @GetMapping("/emp/{id}")
    public Employee getEmp(@PathVariable("id") Integer id){
        return employeeMapper.getEmpById(id);
    }

}
