package com.yck.springbootselflearning.service;

import com.yck.springbootselflearning.dao.Employee;
import com.yck.springbootselflearning.dao.Stu;

public interface StuService {
    Stu getStuById(String id);
    Stu saveStu(Stu stu);
    void deleteStuById(String id);
}
