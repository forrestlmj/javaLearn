package com.yck.springbootselflearning.mapper;

import com.yck.springbootselflearning.dto.DeptSummary;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface DeptSummaryMapper {
    @Select("SELECT d.department_name AS department_name, count(1) AS people_count, sum(e.salary) AS salary_count\n" +
            "FROM department d\n" +
            "\tLEFT JOIN employee e ON d.id = e.dept_id\n" +
            "GROUP BY d.department_name")
    public List<DeptSummary> getDeptSummary();
}
