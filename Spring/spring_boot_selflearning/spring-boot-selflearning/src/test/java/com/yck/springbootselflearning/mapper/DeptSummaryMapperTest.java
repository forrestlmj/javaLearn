package com.yck.springbootselflearning.mapper;

import com.yck.springbootselflearning.dto.DeptSummary;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
@RunWith(SpringRunner.class)

@SpringBootTest
public class DeptSummaryMapperTest {
    @Resource
    public DeptSummaryMapper deptSummaryMapper;
    @Test
    public void getDeptSummary() {
        List<DeptSummary> deptSummaries = deptSummaryMapper.getDeptSummary();
        for(DeptSummary d:deptSummaries){
            System.out.println(d);

        }
    }
}