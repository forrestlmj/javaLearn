package com.atguigu.springboot.mapper;

import com.atguigu.springboot.bean.Employee;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：2020/12/31 下午2:38
 */


public interface EmployeeMapper {
    Employee getEmpById(Integer id);
}
