package com.github.yck.guava.utilities;

import com.google.common.base.CharMatcher;
import org.junit.Test;

/**
 * @author Chengkai Yang
 * @version 1.0
 * @date 2023/12/27 09:47
 * CharMatcher 是个比较独特的类，多用于字符串查找
 * 
 */
public class CharMatcherTest {
    @Test
    public void testMatch(){
        System.out.println(CharMatcher.javaDigit().countIn("123,1aaaa,aaa"));
    }

}
