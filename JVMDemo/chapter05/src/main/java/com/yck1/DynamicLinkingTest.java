package com.yck1;

public class    DynamicLinkingTest {
    int count = 10;

//    public static void main(String[] args) {
//        System.out.println();
//    }
    public void methodA(){
        System.out.println("methodA()...");
    }

    public void methodB(){
        System.out.println("methodB()...");
        methodA();
        count ++;
    }
}
