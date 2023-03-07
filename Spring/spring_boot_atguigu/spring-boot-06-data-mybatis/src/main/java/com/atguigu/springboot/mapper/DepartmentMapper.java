package com.atguigu.springboot.mapper;

import com.atguigu.springboot.bean.Department;
import org.apache.ibatis.annotations.*;
import org.mybatis.spring.annotation.MapperScan;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：2020/12/31 下午2:41
 */

public interface DepartmentMapper {
    @Select("select * from department where id = #{id}")
    Department getDeptById(Integer id);

    @Options(useGeneratedKeys = true, keyProperty = "id")
    @Insert("insert into department(departmentName) values (#{departmentName})")
    int insertDept(Department department);


    @Delete("delete from department where id = #{id}")
    int deleteDeptById(Integer id);
}
