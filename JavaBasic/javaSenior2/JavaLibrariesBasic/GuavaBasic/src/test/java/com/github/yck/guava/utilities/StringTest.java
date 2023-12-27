package com.github.yck.guava.utilities;

import com.google.common.base.Strings;
import org.junit.Test;
import static org.junit.Assert.assertEquals;

/**
 * @author Chengkai Yang
 * @version 1.0
 * @date 2023/12/27 09:47
 *
 * Strings 的处理比较直观，主要就是：
 * 1. null、empty 的处理
 * 2. 前缀和后缀的处理，前padding和后padding的处理
 * 3. 重复字符串
 */
public class StringTest {
    //  ------------------------------------ null、empty 的处理  ------------------------------------

    @Test
    public void testStringNull(){
        assertEquals(Strings.nullToEmpty(null),"");
//        assertEquals(Strings.emptyToNull(""),null);
        assertEquals(Strings.isNullOrEmpty(""),true);
        assertEquals(Strings.isNullOrEmpty(null),true);

    }
    //  ------------------------------------ 前缀和后缀的处理，前padding和后padding的处理  ------------------------------------
    @Test
    public void testPrefixAndPadding(){
        assertEquals(Strings.commonPrefix("javaSz","javaScript"),"javaS");
        assertEquals(Strings.commonSuffix("yck","yckkck"),"ck");

        assertEquals(Strings.padStart("yck",5,'.'),"..yck");
        assertEquals(Strings.padEnd("yck",5,'.'),"yck..");

    }
    //  ------------------------------------ 重复字符串  ------------------------------------

}
