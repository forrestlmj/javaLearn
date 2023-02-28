package com.github.yck.pattern.factory;

import com.github.yck.pattern.creational.factory.cmdUtil;

class cmdUtilTest {
//    @Test
    public void test(){
        for (int i = 0; i < 3; i++) {
            System.out.println(cmdUtil.getCmdInput("input pizza 种类:"));
        }
    }

}