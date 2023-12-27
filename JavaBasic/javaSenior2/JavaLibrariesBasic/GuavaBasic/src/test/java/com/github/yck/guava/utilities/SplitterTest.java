package com.github.yck.guava.utilities;

import com.google.common.base.Splitter;
import com.google.common.collect.ImmutableMap;
import org.junit.Assert;
import org.junit.Test;

import java.util.List;
import java.util.Map;

/**
 * @author Chengkai Yang
 * @version 1.0
 * @date 2023/12/26 09:57
 */
public class SplitterTest {

    //  ------------------------------------ 普通分割，处理空字符串，trim等 ------------------------------------
    @Test
    public void test(){
        String words = "  scala  ,,java  ,,js,python   ";

        // 调用 split 返回迭代器，调用 splitToList 返回集合
        List<String> re = Splitter.on(",").splitToList(words);
        System.out.println(re);

        System.out.println(Splitter.on(",").omitEmptyStrings().splitToList(words));
        Splitter.on(",")
                        .trimResults()
                .omitEmptyStrings().splitToList(words).forEach(
                        c -> {
                            System.out.printf("%s,%d\n",c,c.length());
                        }
                );


    }
    //  ------------------------------------ 定长切割 ------------------------------------
    @Test
    public void testFix(){
        String words = "aaaabbbbccccdddd";
        System.out.println(Splitter.fixedLength(4).splitToList(words));
    }

    //  ------------------------------------ 切割后变为map ------------------------------------
    @Test
    public void testMap(){
        String words = "spark:java,hadoop:java,flink:scala,scrapy:python,pandas:python";
        Map<String, String> map = Splitter.on(",")
                .withKeyValueSeparator(":")
                .split(words);
        System.out.println(map);

    }
}
