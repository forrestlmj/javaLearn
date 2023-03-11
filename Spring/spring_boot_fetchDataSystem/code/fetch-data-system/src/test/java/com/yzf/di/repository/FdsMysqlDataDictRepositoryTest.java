package com.yzf.di.repository;

import com.yzf.di.dao.repository.MysqlDataDictRepository;
import com.yzf.di.entity.po.FdsMysqlDataDict;
import com.yzf.di.util.TestTool;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@SpringBootTest
@RunWith(SpringRunner.class)
public class FdsMysqlDataDictRepositoryTest {
    @Autowired
    private MysqlDataDictRepository mysqlDataDictRepository;

    @Before
    public void add(){
        mysqlDataDictRepository.deleteAll();
        List<FdsMysqlDataDict> l = TestTool.prepareMysqlDataDictDao();
        mysqlDataDictRepository.saveAll(l);


    }
    @Test
    public void deleteByMysqlSourceId() {
        mysqlDataDictRepository.deleteByMysqlSourceId(1);
        mysqlDataDictRepository.deleteByMysqlSourceId(2);
        mysqlDataDictRepository.deleteByMysqlSourceId(3);
        mysqlDataDictRepository.deleteByMysqlSourceId(4);
//        Assert.assertEquals(4,mysqlDataDictRepository.count());

    }


}