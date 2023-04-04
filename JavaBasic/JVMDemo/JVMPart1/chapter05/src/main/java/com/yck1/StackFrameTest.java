package com.yck1;

public class StackFrameTest {
    public static void main(String[] args) {
        StackFrameTest sft = new StackFrameTest();
        sft.methodA();
    }
    public void methodA(){
        System.out.println("开始methodA");
        Long aLong = methodB();
        System.out.println(aLong);
        System.out.println("结束 methodA");
    }
    public Long methodB(){
        Long a = 1L;
        System.out.println("开始 methodB");
        methodC();
        System.out.println("结束 methodB");
        return a;
    }
    public void methodC(){
        System.out.println("开始 methodC");

        System.out.println("结束 methodC");
    }
}
