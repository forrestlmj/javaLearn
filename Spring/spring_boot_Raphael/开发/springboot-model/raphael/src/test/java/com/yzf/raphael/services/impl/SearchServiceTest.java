package com.yzf.raphael.services.impl;

import com.yzf.raphael.dao.AreaNode;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

import static org.junit.Assert.*;
@RunWith(SpringRunner.class)
@SpringBootTest
public class SearchServiceTest {
    @Autowired
    private SearchService searchService;
    @Test
    public void getAreaNode() {
        List<AreaNode> areaNode = searchService.getAreaNode();
        System.out.println(areaNode);
    }
}