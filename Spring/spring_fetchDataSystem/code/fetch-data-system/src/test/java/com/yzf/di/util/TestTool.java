package com.yzf.di.util;

import com.yzf.di.constants.MappingMethodEnum;
import com.yzf.di.entity.FdsLogicViewMapping;
import com.yzf.di.entity.FdsMysqlDataDict;
import com.yzf.di.entity.FdsMysqlSource;
import org.junit.Assert;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

public class TestTool {
    public static FdsMysqlSource getDevMysqlSourceDao(){
        FdsMysqlSource fdsMysqlSource = new FdsMysqlSource();
        fdsMysqlSource.setId(1);
        fdsMysqlSource.setIp("172.37.4.57:3306");
        fdsMysqlSource.setUsername("root");
        fdsMysqlSource.setPassword("123456");
        fdsMysqlSource.setInstance("开发机 172.37.4.57 中docker 的mysql实例");
        return fdsMysqlSource;
    }

    /**
     * 准备 三份数据：
     * 1、分库分表的 4分库2分表 ztkm_kmye
     * 2、不分库之分表的 不分库 4分表的 invoice_master
     * 3、不分库不分表的 abc\def
     * 并将数据写入到 MysqlDataDictDao mysql表中。
     */
    public static List<FdsMysqlDataDict> prepareMysqlDataDictDao(){
        List<FdsMysqlDataDict> l1 = new ArrayList<>();

        l1.add(new FdsMysqlDataDict(0,"ndz_account_0","fintax_account_0","ztkm_kmye_0",1L,"","ab","varchar","",""));
        l1.add(new FdsMysqlDataDict(0,"ndz_account_0","fintax_account_0","ztkm_kmye_0",1L,"","ac","varchar","",""));
        l1.add(new FdsMysqlDataDict(0,"ndz_account_0","fintax_account_0","ztkm_kmye_1",1L,"科目余额","ab","varchar","","字段ab"));
        l1.add(new FdsMysqlDataDict(0,"ndz_account_0","fintax_account_0","ztkm_kmye_1",1L,"科目余额","ac","varchar","","字段ac"));

        l1.add(new FdsMysqlDataDict(1,"ndz_account_1","fintax_account_1","ztkm_kmye_0",1L,"","ab","varchar","",""));
        l1.add(new FdsMysqlDataDict(1,"ndz_account_1","fintax_account_1","ztkm_kmye_0",1L,"","ac","varchar","",""));
        l1.add(new FdsMysqlDataDict(1,"ndz_account_1","fintax_account_1","ztkm_kmye_1",1L,"","ab","varchar","",""));
        l1.add(new FdsMysqlDataDict(1,"ndz_account_1","fintax_account_1","ztkm_kmye_1",1L,"","ac","varchar","",""));

        l1.add(new FdsMysqlDataDict(2,"ndz_account_2","fintax_account_2","ztkm_kmye_0",1L,"","ab","varchar","",""));
        l1.add(new FdsMysqlDataDict(2,"ndz_account_2","fintax_account_2","ztkm_kmye_0",1L,"","ac","varchar","",""));
        l1.add(new FdsMysqlDataDict(2,"ndz_account_2","fintax_account_2","ztkm_kmye_1",1L,"","ab","varchar","",""));
        l1.add(new FdsMysqlDataDict(2,"ndz_account_2","fintax_account_2","ztkm_kmye_1",1L,"","ac","varchar","",""));

        l1.add(new FdsMysqlDataDict(3,"ndz_account_3","fintax_account_3","ztkm_kmye_0",1L,"","ab","varchar","",""));
        l1.add(new FdsMysqlDataDict(3,"ndz_account_3","fintax_account_3","ztkm_kmye_0",1L,"","ac","varchar","",""));
        l1.add(new FdsMysqlDataDict(3,"ndz_account_3","fintax_account_3","ztkm_kmye_1",1L,"","ab","varchar","",""));
        l1.add(new FdsMysqlDataDict(3,"ndz_account_3","fintax_account_3","ztkm_kmye_1",1L,"","ac","varchar","",""));
        // 2、不分库之分表的 不分库 4分表的 invoice_master
        l1.add(new FdsMysqlDataDict(4,"ndz_e","fintax-invoice","invoice_master_0",1L,"发票主表","in1","varchar","","字段in1"));
        l1.add(new FdsMysqlDataDict(4,"ndz_e","fintax-invoice","invoice_master_0",1L,"发票主表","in2","varchar","","字段in2"));

        l1.add(new FdsMysqlDataDict(4,"ndz_e","fintax-invoice","invoice_master_1",1L,"","in1","varchar","",""));
        l1.add(new FdsMysqlDataDict(4,"ndz_e","fintax-invoice","invoice_master_1",1L,"","in2","varchar","",""));

        l1.add(new FdsMysqlDataDict(4,"ndz_e","fintax-invoice","invoice_master_2",1L,"","in1","varchar","",""));
        l1.add(new FdsMysqlDataDict(4,"ndz_e","fintax-invoice","invoice_master_2",1L,"","in2","varchar","",""));

        l1.add(new FdsMysqlDataDict(4,"ndz_e","fintax-invoice","invoice_master_3",1L,"","in1","varchar","",""));
        l1.add(new FdsMysqlDataDict(4,"ndz_e","fintax-invoice","invoice_master_3",1L,"","in2","varchar","",""));
        // 2、不分库不分表的 abc\def
        l1.add(new FdsMysqlDataDict(4,"ndz_e","fintax-invoice","abc",1L,"","abc1","varchar","",""));
        l1.add(new FdsMysqlDataDict(4,"ndz_e","fintax-invoice","abc",1L,"","abc2","varchar","",""));

        l1.add(new FdsMysqlDataDict(4,"ndz_e","fintax-invoice","def",1L,"","def1","varchar","",""));
        l1.add(new FdsMysqlDataDict(4,"ndz_e","fintax-invoice","def",1L,"","def2","varchar","",""));

        // 2、不分库不分表的 abc\def
        l1.add(new FdsMysqlDataDict(4,"ndz_e","fintax-invoice","cannot_logic_1",1L,"","abc1","varchar","",""));
        l1.add(new FdsMysqlDataDict(4,"ndz_e","fintax-invoice","cannot_logic_1",1L,"","abc2","varchar","",""));

        l1.add(new FdsMysqlDataDict(4,"ndz_e","fintax-invoice","cannot_logic_2",1L,"","def1","varchar","",""));
        l1.add(new FdsMysqlDataDict(4,"ndz_e","fintax-invoice","cannot_logic_2",1L,"","def2","varchar","",""));



        return l1;
    }
    /**
     * 6个手工映射表，两个自动映射表
     */
    public static List<FdsLogicViewMapping> prepareLogicViewMappingDao() {
        List<FdsLogicViewMapping> l = new ArrayList<>();
        l.add(new FdsLogicViewMapping("db","table",0, MappingMethodEnum.MANUAL.value(), "db_1","table_1"));
        l.add(new FdsLogicViewMapping("db","table",0,MappingMethodEnum.MANUAL.value(), "db_1","table_2"));
        l.add(new FdsLogicViewMapping("db","table",0, MappingMethodEnum.MANUAL.value(), "db_2","table_1"));
        l.add(new FdsLogicViewMapping("db","table",0, MappingMethodEnum.MANUAL.value(), "db_2","table_2"));

        l.add(new FdsLogicViewMapping("mydb","mytable",1, MappingMethodEnum.MANUAL.value(), "mydb","mytable"));
        l.add(new FdsLogicViewMapping("mydb","mytable",1, MappingMethodEnum.AUTOMATIC.value(), "mydb","mytable"));
        l.add(new FdsLogicViewMapping("mydb","mytable",1, MappingMethodEnum.AUTOMATIC.value(), "mydb","mytable"));
        l.add(new FdsLogicViewMapping("mydb","mytable",1, MappingMethodEnum.MANUAL.value(), "mydb","mytable"));


        return l;
    }

    public static List<FdsMysqlSource> prepareFdsMysqlSource() {
        List<FdsMysqlSource> l = new ArrayList<>();
        l.add(new FdsMysqlSource(1,"ndz_account_1","111.111.111.111"));
        l.add(new FdsMysqlSource(2,"ndz_account_2","111.111.111.112"));
        l.add(new FdsMysqlSource(3,"ndz_account_3","111.111.111.113"));
        l.add(new FdsMysqlSource(4,"ndz_e","111.111.111.114"));
        l.add(new FdsMysqlSource(5,"ft0","111.111.111.115"));
        l.add(new FdsMysqlSource(6,"ft1","111.111.111.116"));
        return l;
    }

    @Test
    public void test() {

        Pattern pattern = Pattern.compile("_\\d*$");
        Assert.assertEquals(pattern.matcher("fintax_tax_202101").replaceAll("").trim(), "fintax_tax");
        Assert.assertEquals(pattern.matcher("fintax_tax_2021").replaceAll("").trim(), "fintax_tax");
        Assert.assertEquals(pattern.matcher("fintax_1tax_1_2021").replaceAll("").trim(), "fintax_1tax_1");
        Assert.assertEquals(pattern.matcher("fintax_1tax").replaceAll("").trim(), "fintax_1tax");

        Assert.assertEquals(pattern.matcher("fintax_tax_0").replaceAll("").trim(), "fintax_tax");
        Assert.assertEquals(pattern.matcher("fintax_tax_1").replaceAll("").trim(), "fintax_tax");
        Assert.assertEquals(pattern.matcher("fintax_tax_15").replaceAll("").trim(), "fintax_tax");
        Assert.assertEquals(pattern.matcher("fintax_tax_31").replaceAll("").trim(), "fintax_tax");



    }
}
