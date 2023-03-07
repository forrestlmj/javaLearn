package com.yck.springbootselflearning.service;

import com.yck.springbootselflearning.dao.Department;
import com.yck.springbootselflearning.dto.DeptSummary;

import java.util.List;

public interface DepartmentService {
    Department getDeptById(Integer id);
    Department saveDept(Department department);
    void deleteDeptById(Integer id);
    List<DeptSummary> getDeptSummary();
}
