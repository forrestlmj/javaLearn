package com.yzf.di.entity;

import org.junit.Test;

import java.util.Date;

public class MysqlSourceTest {
    @Test
    public void test(){
        Date date = new Date();
        System.out.println(date.getTime());

        System.out.println(new Date());
    }
}