package com.yzf.selfqueue.util;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

public class ParseSql {
    public static String parse(String json){
        JSONObject j = JSON.parseObject(json);
        return j.get("sql").toString();
    }
}
