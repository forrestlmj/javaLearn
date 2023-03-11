package com.yzf.di.service.impl;

import com.yzf.di.entity.po.FdsLogicViewMapping;
import com.yzf.di.entity.po.FdsLogicViewSchema;
import com.yzf.di.entity.po.FdsMysqlDataDict;
import com.yzf.di.dao.repository.LogicViewMappingRepository;
import com.yzf.di.dao.repository.LogicViewSchemaRepository;
import com.yzf.di.dao.repository.MysqlDataDictRepository;
import com.yzf.di.service.LogicViewMappingService;
import com.yzf.di.service.LogicViewSchemaService;
import com.yzf.di.util.TestTool;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.jupiter.api.Order;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;
import java.util.stream.Collectors;

@SpringBootTest
@RunWith(SpringRunner.class)
public class FdsLogicViewSchemaServiceImplTest {
    @Autowired
    private LogicViewSchemaService logicViewSchemaService;
    @Autowired
    private LogicViewMappingRepository logicViewMappingRepository;
    @Autowired
    private LogicViewSchemaRepository logicViewSchemaRepository;
    @Autowired
    private MysqlDataDictRepository mysqlDataDictRepository;
    @Autowired
    private LogicViewMappingService logicViewMappingService;

    @Before
    public void prepare(){
        logicViewMappingRepository.deleteAll();
        List<FdsLogicViewMapping> manual = TestTool.prepareLogicViewMappingDao();
        logicViewMappingRepository.saveAll(manual);
        mysqlDataDictRepository.deleteAll();
        // 1、分库分表的 4分库2分表 ztkm_kmye 4分库2分表 kmye
        List<FdsMysqlDataDict> l1 = TestTool.prepareMysqlDataDictDao();
        mysqlDataDictRepository.saveAll(l1);
        logicViewMappingService.automaticInit();


    }
//    @Test
//    @Ignore
//    @Order(1)
//    public void checkSchema1() {
//        List<LogicViewMappingDao> logicViewMappingDao = logicViewMappingService.getAllLogicViewMappingDao();
//        System.out.println(logicViewMappingDao);
//        // 单库单表
//        List<LogicViewMappingDao> fintax_account = logicViewMappingDao.stream().filter(t -> t.getLogicDatabase().equals("fintax-invoice") && t.getLogicTable().equals("def")).collect(Collectors.toList());
//        System.out.println(fintax_account);
////        Assert.assertEquals();
//        Assert.assertTrue(logicViewSchemaService.checkSchema(fintax_account));
//    }
//    @Test
//    @Ignore
//    @Order(2)
//    public void checkSchema2() {
//        List<LogicViewMappingDao> logicViewMappingDao = logicViewMappingService.getAllLogicViewMappingDao();
//        System.out.println(logicViewMappingDao);
//        // 分库分表
//        List<LogicViewMappingDao> fintax_account = logicViewMappingDao.stream().filter(t -> t.getLogicDatabase().equals("fintax_account") && t.getLogicTable().equals("ztkm_kmye")).collect(Collectors.toList());
//        System.out.println(fintax_account);
////        Assert.assertEquals();
//        Assert.assertTrue(logicViewSchemaService.checkSchema(fintax_account));
//    }
//    @Test
//    @Ignore
//    @Order(3)
//    public void checkSchemaFalse() {
//        List<LogicViewMappingDao> logicViewMappingDao = logicViewMappingService.getAllLogicViewMappingDao();
//        System.out.println(logicViewMappingDao);
//        // 分库分表
//        List<LogicViewMappingDao> re = logicViewMappingDao.stream().filter(t -> t.getLogicDatabase().equals("fintax-invoice") && t.getLogicTable().equals("cannot_logic")).collect(Collectors.toList());
//        System.out.println(re);
////        Assert.assertEquals();
//        Assert.assertFalse(logicViewSchemaService.checkSchema(re));
//    }


    @Test
    @Order(4)
    public void checkAndSaveAllAutomaticMappingSchema() {
        Assert.assertTrue(logicViewSchemaService.checkAndSaveAllAutomaticMappingSchema());
        List<FdsLogicViewSchema> list = logicViewSchemaRepository.findAll();
        Assert.assertEquals(2,list.stream().filter(t -> t.getLogicTable().equals("ztkm_kmye")).count());
        Assert.assertEquals(4,list.stream().filter(t -> t.getLogicTable().equals("cannot_logic")).count());
        Assert.assertEquals(2,list.stream().filter(t -> t.getLogicTable().equals("invoice_master")).count());
        Assert.assertEquals(2,list.stream().filter(t -> t.getLogicTable().equals("abc")).count());
        Assert.assertEquals(2,list.stream().filter(t -> t.getLogicTable().equals("def")).count());

        Assert.assertEquals("科目余额",list.stream().filter(t -> t.getLogicTableComment().equals("科目余额"))
                .collect(Collectors.toList()).get(0).getLogicTableComment());

        Assert.assertEquals("字段in1",list.stream().filter(t -> t.getLogicColumnComment().equals("字段in1"))
                .collect(Collectors.toList()).get(0).getLogicColumnComment());
        Assert.assertEquals("字段ab",list.stream().filter(t -> t.getLogicColumnComment().equals("字段ab"))
                .collect(Collectors.toList()).get(0).getLogicColumnComment());

    }

    @Test
    @Order(5)
    public void list() {
    }
}