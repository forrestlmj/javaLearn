package com.yzf.selfqueue.util;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class ParseSqlTest {

    @Test
    void parse() {
        String json = "{\"sql\":\"select * from backup_offset\"}";
        assertEquals("select * from backup_offset",ParseSql.parse(json));
    }
}