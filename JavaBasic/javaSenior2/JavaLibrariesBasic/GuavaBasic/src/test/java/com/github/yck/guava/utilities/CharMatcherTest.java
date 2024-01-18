package com.github.yck.guava.utilities;

import com.google.common.base.CharMatcher;
import org.junit.Assert;
import org.junit.Test;

/**
 * @author Chengkai Yang
 * @version 1.0
 * @date 2023/12/27 09:47
 * CharMatcher 是个比较独特的类，多用于字符串查找
 *
 */
public class CharMatcherTest {
    private static final String word = "123,1aaaa,V";
    @Test
    public void testMatch(){
        Assert.assertEquals(CharMatcher.javaDigit().countIn(word),4);
        Assert.assertEquals(CharMatcher.javaDigit().indexIn(word),0);
        Assert.assertEquals(CharMatcher.javaDigit().lastIndexIn(word),4);
        System.out.println(CharMatcher.javaDigit().replaceFrom(word,'s'));


        Assert.assertEquals(CharMatcher.javaUpperCase().countIn(word),1);
        Assert.assertEquals(CharMatcher.javaLowerCase().countIn(word),4);


        ;
    }

}
