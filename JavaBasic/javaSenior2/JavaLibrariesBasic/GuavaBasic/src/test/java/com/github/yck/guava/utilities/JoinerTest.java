package com.github.yck.guava.utilities;

import com.google.common.base.Joiner;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import jdk.nashorn.internal.runtime.regexp.JoniRegExp;
import org.junit.Test;

import java.io.FileWriter;
import java.io.IOException;
import java.util.*;

import static org.junit.Assert.assertEquals;

/**
 * @author Chengkai Yang
 * @version 1.0
 * @date 2023/12/22 09:13
 * Joiner 的特点是
 * 1. 集合类 join 为 String，同时处理集合类中有空值的情况，可以 skip 或 设置为默认值
 */
public class JoinerTest {
    // ------------------------------------ 1. Join 处理 Iterable  ------------------------------------

    private static final List<String> words = ImmutableList.of("scala","java","python","js");
    private static final List<String> wordsWithNull = Arrays.asList("scala",null,"java",null,"python","js");

    /**
     * 将集合类拼接为 String
     * 对于 null 的处理比较好，直接支持 skip Null 和 useForNull
     */
    @Test
    public void test_Joiner_on_Iterable(){
        String join = Joiner.on(",").join(words);
        assertEquals(join, "scala,java,python,js");
        assertEquals(Joiner.on(",").skipNulls().join(wordsWithNull), "scala,java,python,js");
        assertEquals(
                Joiner.on(",").useForNull("null").join(wordsWithNull),
                "scala,null,java,null,python,js"
        );
    }

    @Test(expected = NullPointerException.class)
    public void test_Joiner_on_Join_Null_String(){
        Joiner.on(",").join(wordsWithNull);
    }


    // ------------------------------------ withKeyValueSeparator  ------------------------------------
    private static final Map<String,String > wordMap = ImmutableMap.of(
            "spark","scala",
            "hadoop","java"
    );

    @Test
    public void test_Joiner_on_Map(){
        String join = Joiner.on(",").withKeyValueSeparator(":").useForNull("").join(wordMap);

        System.out.println(join);
        assertEquals(join,"spark:scala,hadoop:java");
    }

    @Test
    public void test_Joiner_on_Null_Map(){
        assertEquals(Joiner.on(",").withKeyValueSeparator(":").useForNull("null").join(new HashMap<String, String>() {{
            put(null, null);
            put("null", null);
            put("null", "null");
                                                                                             }}
        ),"null:null,null:null");
    }


    // ------------------------------------ 第三个场景是 Guava 处理 appendable 接口，非常好用  ------------------------------------

    /**
     * ，由于 Files，StringBuilder 等操作 char 相关的字符串都用到了 Appendable 接口。
     * 相当于将 iterable 中的对象迭代到 Appendable 对象中，再调用 Appendable 进行更多操作。
     * 比如 StringBuilder,Files
     */
    @Test
    public void test_Joiner_on_Appendable_StringBuilder(){
        StringBuilder sb = new StringBuilder();
        sb.append("The result is ");
        StringBuilder append = Joiner.on(",").appendTo(sb, words).append(".");
        assertEquals(sb.toString(),"The result is scala,java,python,js.");

    }

    /**
     * 这里用 guava 的Files 试一下 Joiner 方法，非常的好用
     */
    @Test
    public void test_Joiner_on_Appendable_File() throws IOException {
        String filePath = "/Users/chengkaiyang/IdeaProjects/javaLearn/JavaBasic/javaSenior2/JavaLibrariesBasic/GuavaBasic/src/test/java/com/github/yck/guava/utilities/test_Joiner_on_Appendable_File.txt";
        FileWriter fileWriter = new FileWriter(filePath);

        fileWriter.append("This is the result:");
        Joiner.on(",").useForNull("null").appendTo(fileWriter,wordsWithNull);
        fileWriter.append(". \nWrite from com.github.yck.guava.utilities.JoinerTest.test_Joiner_on_Appendable_File");
        fileWriter.close();
    }
}