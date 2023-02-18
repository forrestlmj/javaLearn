package com.github.yck.principle.singleresponsibility;

/**
 * Single Responsibility 单一职责
 * 这是一个错误案例，用一个类来运行两种事物的方法
 * 改进：
 *  - 拆分为类
 *  - 拆分为方法
 */
public class SingleResponsibility1 {
    public static void main(String[] args) {
        Vehicle v = new Vehicle();
        v.run("汽车");
        v.run("飞机");
    }
}

class Vehicle{
    public void run(String msg){
        System.out.println(msg+"跑在道上");
    }
}