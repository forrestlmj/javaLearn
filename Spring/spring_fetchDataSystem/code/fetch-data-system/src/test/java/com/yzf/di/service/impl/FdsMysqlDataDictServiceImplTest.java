package com.yzf.di.service.impl;

import com.yzf.di.entity.FdsMysqlDataDict;
import com.yzf.di.entity.FdsMysqlSource;
import com.yzf.di.service.MysqlDataDictService;
import com.yzf.di.util.TestTool;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.test.context.junit4.SpringRunner;

@SpringBootTest
@RunWith(SpringRunner.class)
public class FdsMysqlDataDictServiceImplTest {
    @Autowired
    private MysqlDataDictService mysqlDataDiceService;
    private FdsMysqlSource fdsMysqlSource;
    @Before
    public void fetch() {

//        mysqlSourceDao.setUsername("");
        mysqlDataDiceService.fetch(TestTool.getDevMysqlSourceDao());
    }

    @Test
    public void list() {
        Page<FdsMysqlDataDict> list0 = mysqlDataDiceService.list(0,10);
        for (FdsMysqlDataDict fdsMysqlDataDict : list0) {
            System.out.println(fdsMysqlDataDict);
        }
        System.out.println("-----------");

        Page<FdsMysqlDataDict> list = mysqlDataDiceService.list(1,10);
        for (FdsMysqlDataDict fdsMysqlDataDict : list) {
            System.out.println(fdsMysqlDataDict);
        }
        System.out.println("-----------");
        Page<FdsMysqlDataDict> list2 = mysqlDataDiceService.list(2,10);
        for (FdsMysqlDataDict fdsMysqlDataDict : list2) {
            System.out.println(fdsMysqlDataDict);
        }
    }
}