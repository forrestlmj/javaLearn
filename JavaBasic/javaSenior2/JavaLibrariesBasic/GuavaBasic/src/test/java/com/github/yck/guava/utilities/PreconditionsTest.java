package com.github.yck.guava.utilities;

import cn.hutool.core.lang.Assert;
import com.google.common.base.Preconditions;
import org.junit.Test;

/**
 * @author Chengkai Yang
 * @version 1.0
 * @date 2024/1/18 19:38
 */
public class PreconditionsTest {

    // ------------------------------------ 类似于 hutool 中的断言  ------------------------------------

    @Test(expected = NullPointerException.class)
    public void testCheckNotNull(){
        Preconditions.checkNotNull(null);
        Assert.notNull(null);

    }

    @Test
    public void testCheckNotNullWithMessage(){
        try {
            Preconditions.checkNotNull(null,"这个为空");
        }catch (NullPointerException e){
            System.out.println(e.getMessage());
        }
    }

    @Test(expected = IllegalStateException.class)
    public void testCheckState(){
        Preconditions.checkState("A".equals("B"),"");
    }
}
