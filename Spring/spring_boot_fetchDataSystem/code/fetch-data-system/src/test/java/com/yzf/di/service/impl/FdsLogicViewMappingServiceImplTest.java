package com.yzf.di.service.impl;

import com.yzf.di.constants.MappingMethodEnum;
import com.yzf.di.constants.ShardingStrategyEnum;
import com.yzf.di.entity.po.FdsLogicViewMapping;
import com.yzf.di.entity.po.FdsMysqlDataDict;
import com.yzf.di.entity.dto.LogicViewDto;
import com.yzf.di.entity.po.FdsMysqlSource;
import com.yzf.di.dao.repository.LogicViewMappingRepository;
import com.yzf.di.dao.repository.MysqlDataDictRepository;
import com.yzf.di.dao.repository.MysqlSourceRepository;
import com.yzf.di.util.TestTool;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.jupiter.api.Order;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.*;

@SpringBootTest
@RunWith(SpringRunner.class)
public class FdsLogicViewMappingServiceImplTest {
    @Autowired
    private LogicViewMappingServiceImpl logicViewMappingService;
    @Autowired
    private MysqlDataDictRepository mysqlDataDictRepository;
    @Autowired
    private LogicViewMappingRepository logicViewMappingRepository;
    @Autowired
    private MysqlSourceRepository mysqlSourceRepository;

    private MultipartFile multipartFile = null;


    @Before
    public void prepare() throws IOException {

        // 准备mysql的链接
        mysqlSourceRepository.deleteAll();
        List<FdsMysqlSource> mysql = TestTool.prepareFdsMysqlSource();
        mysqlSourceRepository.saveAll(mysql);
        // 准备手工文件
        File file = new File("src/main/resources/manual_match.csv");
        FileInputStream inputStream = new FileInputStream(file);
        multipartFile = new MockMultipartFile(
                "file",
                "manual_match.csv",
                MediaType.IMAGE_PNG_VALUE,
                inputStream
        );
        // 准备分库分表数据
        logicViewMappingRepository.deleteAll();
        List<FdsLogicViewMapping> manual = TestTool.prepareLogicViewMappingDao();
        logicViewMappingRepository.saveAll(manual);
        mysqlDataDictRepository.deleteAll();
        // 1、分库分表的 4分库2分表 ztkm_kmye 4分库2分表 kmye
        List<FdsMysqlDataDict> l1 = TestTool.prepareMysqlDataDictDao();
        mysqlDataDictRepository.saveAll(l1);

    }
    /**
     * 测试分页等。
     */
    @Test
    @Ignore
    @Order(0)
    public void list() {
        List<LogicViewDto> list = logicViewMappingService.list(1, 1);
        for (LogicViewDto logicViewDto : list) {
            System.out.println(logicViewDto);
        }
    }





    /**
     * 测试 getLogicViewMappingDao 中mysql对应的分库分表对。
     */
    @Test
    @Order(1)
    public void getLogicViewMappingDao() {
        FdsMysqlDataDict fdsMysqlDataDict = new FdsMysqlDataDict(0, "ndz_account_0", "fintax_account_0", "ztkm_kmye_0", 1L, "", "ac", "varchar", "", "");
        Assert.assertEquals(logicViewMappingService.getLogicViewMappingDao(fdsMysqlDataDict).getLogicDatabase(),"fintax_account");
        Assert.assertEquals(logicViewMappingService.getLogicViewMappingDao(fdsMysqlDataDict).getLogicTable(),"ztkm_kmye");


        FdsMysqlDataDict fdsMysqlDataDict1 = new FdsMysqlDataDict(0, "ndz_account_2021", "fintax_a1ccount_0", "ztkm_kmye_202108", 1L, "", "ac", "varchar", "", "");
        Assert.assertEquals(logicViewMappingService.getLogicViewMappingDao(fdsMysqlDataDict1).getLogicDatabase(),"fintax_a1ccount");
        Assert.assertEquals(logicViewMappingService.getLogicViewMappingDao(fdsMysqlDataDict1).getLogicTable(),"ztkm_kmye");
    }

    @Test
    @Order(2)
    public void getAllLogicViewMappingDao() {
        List<FdsLogicViewMapping> fdsLogicViewMapping = logicViewMappingService.getAllLogicViewMappingDao();
        fdsLogicViewMapping.forEach(System.out::println);

        Assert.assertEquals(8, fdsLogicViewMapping.stream().filter((t) -> t.getLogicDatabase().equals("fintax_account")
                && t.getLogicTable().equals("ztkm_kmye")
                && t.getShardingStrategy().equals(ShardingStrategyEnum.SHARDING_DB_TBL.value()))
                .count());

       Assert.assertEquals(4, fdsLogicViewMapping.stream().filter(t -> t.getLogicDatabase().equals("fintax-invoice")
               && t.getLogicTable().equals("invoice_master")
               && t.getShardingStrategy().equals(ShardingStrategyEnum.SHARDING_DB_TBL.value()))
               .count());

       Assert.assertEquals(1, fdsLogicViewMapping.stream().filter(t -> t.getLogicDatabase().equals("fintax-invoice")
               && t.getLogicTable().equals("abc")
               && t.getShardingStrategy().equals(ShardingStrategyEnum.NONSHARDING.value()))
               .count());

        Assert.assertEquals(1, fdsLogicViewMapping.stream().filter(t -> t.getLogicDatabase().equals("fintax-invoice")
                && t.getLogicTable().equals("def")
                && t.getShardingStrategy().equals(ShardingStrategyEnum.NONSHARDING.value()))
                .count());
    }
    /**
     * 测试自动匹配功能
     */
    @Test
    @Order(3)
    public void automaticInit() {
        logicViewMappingService.automaticInit();


        // Assert
        List<FdsLogicViewMapping> fdsLogicViewMapping = logicViewMappingRepository.findAll();
        // 1、测试分库分表正确
        Assert.assertEquals(8, fdsLogicViewMapping.stream().filter((t) -> t.getLogicDatabase().equals("fintax_account")
                && t.getLogicTable().equals("ztkm_kmye")
                && t.getShardingStrategy().equals(ShardingStrategyEnum.SHARDING_DB_TBL.value()))
                .count());

        Assert.assertEquals(4, fdsLogicViewMapping.stream().filter(t -> t.getLogicDatabase().equals("fintax-invoice")
                && t.getLogicTable().equals("invoice_master")
                && t.getShardingStrategy().equals(ShardingStrategyEnum.SHARDING_DB_TBL.value()))
                .count());

        Assert.assertEquals(1, fdsLogicViewMapping.stream().filter(t -> t.getLogicDatabase().equals("fintax-invoice")
                && t.getLogicTable().equals("abc")
                && t.getShardingStrategy().equals(ShardingStrategyEnum.NONSHARDING.value()))
                .count());

        Assert.assertEquals(1, fdsLogicViewMapping.stream().filter(t -> t.getLogicDatabase().equals("fintax-invoice")
                && t.getLogicTable().equals("def")
                && t.getShardingStrategy().equals(ShardingStrategyEnum.NONSHARDING.value()))
                .count());
        // 2、测试 自动分库分表不会影响到用户手工分库分表
        Assert.assertEquals(6, fdsLogicViewMapping.stream().filter(t -> t.getMappingMethod().equals(MappingMethodEnum.MANUAL.value())).count());
    }
    /**
     * 测试 文件匹配
     * https://blog.csdn.net/qq_21084687/article/details/84333188
     */
    @Test
    @Order(4)
    public void manualInitFromFile() {
        logicViewMappingService.automaticInit();

        logicViewMappingService.manualInitFromFile(multipartFile);

        List<FdsLogicViewMapping> all = logicViewMappingRepository.findAll();
        Assert.assertTrue(all.stream().filter(t -> t.getMappingMethod().equals(MappingMethodEnum.MANUAL_DEFINED_IN_FILE.value()))
                .count() > 0);
    }

}