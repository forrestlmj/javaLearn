package com.github.yck.pattern.factory;

class cmdUtilTest {
//    @Test
    public void test(){
        for (int i = 0; i < 3; i++) {
            System.out.println(cmdUtil.getCmdInput("input pizza 种类:"));
        }
    }

}