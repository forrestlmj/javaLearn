package com.yzf.di.util;

import com.yzf.di.entity.FdsMysqlDataDict;
import org.junit.Test;

import java.util.List;

public class JDBCUtilTest {

    @Test
    public void fetch() {
        JDBCUtil jdbcUtil = new JDBCUtil();

        List<FdsMysqlDataDict> fetch = jdbcUtil.fetch(TestTool.getDevMysqlSourceDao());
        for (FdsMysqlDataDict fdsMysqlDataDict : fetch) {
            System.out.println(fdsMysqlDataDict);
        }
    }
    @Test
    public void test(){
        System.out.println(Long.MAX_VALUE);

    }
}