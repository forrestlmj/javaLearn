package com.yzf.di.service;

import com.yzf.di.entity.po.FdsMysqlSource;
import com.yzf.di.dao.repository.MysqlSourceRepository;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.ArrayList;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class MysqlSourceServiceTest {
    private List<FdsMysqlSource> fdsMysqlSourceList = new ArrayList<>();
    @Autowired
    private MysqlSourceService mysqlSourceService;
    @Autowired
    private MysqlSourceRepository mysqlSourceRepository;
    @Before
    public void prepare(){
        fdsMysqlSourceList.add(new FdsMysqlSource("172.11.11.11","mysql1号库"));
        fdsMysqlSourceList.add(new FdsMysqlSource("172.11.11.11","mysql1号库"));
        fdsMysqlSourceList.add(new FdsMysqlSource("172.11.11.12","mysql2号库"));
        fdsMysqlSourceList.add(new FdsMysqlSource("172.11.11.13","mysql2号库"));
        mysqlSourceRepository.deleteAll();
    }
    public MysqlSourceServiceTest() {
    }
    @Test
    public void addOrUpdate() {
        Assert.assertTrue(mysqlSourceService.addOrUpdate(fdsMysqlSourceList.get(0)));
        Assert.assertFalse(mysqlSourceService.addOrUpdate(fdsMysqlSourceList.get(1)));

        Assert.assertTrue(mysqlSourceService.addOrUpdate(fdsMysqlSourceList.get(2)));
        Assert.assertFalse(mysqlSourceService.addOrUpdate(fdsMysqlSourceList.get(3)));

        FdsMysqlSource fdsMysqlSource = new FdsMysqlSource();
        fdsMysqlSource.setId(1);
        fdsMysqlSource.setInstance("mysql1号库修改后");
        Assert.assertTrue(mysqlSourceService.addOrUpdate(fdsMysqlSource));

    }
    @Test
    public void list() {
//        System.out.println(mysqlSourceService.list());
    }

    @Test
    public void getById() {
    }

    @Test
    public void deleteById() {
    }


}