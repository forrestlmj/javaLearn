package com.yck.springbootselflearning.service.impl;

import com.yck.springbootselflearning.dao.Department;
import com.yck.springbootselflearning.dto.DeptSummary;
import com.yck.springbootselflearning.mapper.DeptSummaryMapper;
import com.yck.springbootselflearning.repository.DepartmentRepository;
import com.yck.springbootselflearning.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Optional;

/**
 * @author ：forrestlmj@github.com
 * @description：TODO
 * @date ：2021/1/1 下午12:54
 */

@Service
public class DepartmentServiceImpl implements DepartmentService {
    @Autowired
    private DepartmentRepository departmentRepository;
    @Resource
    private DeptSummaryMapper deptSummaryMapper;
    @Override
    public Department getDeptById(Integer id) {
        Department one = departmentRepository.findById(id).orElse(null);
        return one;
    }

    @Override
    public Department saveDept(Department department) {
        return departmentRepository.save(department);
    }

    @Override
    public void deleteDeptById(Integer id) {
        departmentRepository.deleteById(id);
    }

    @Override
    public List<DeptSummary> getDeptSummary() {
        return deptSummaryMapper.getDeptSummary();
    }


}
