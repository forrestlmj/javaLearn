package com.github.yck.principle.singleresponsibility;

/**
 * Single Responsibility 单一职责
 * 也可以通过方法拆分的方式来体现单一原则
 */
public class SingleResponsibility3 {
    public static void main(String[] args) {
        Vehicle2 v = new Vehicle2();
        v.runRoad("汽车");
        v.runWater("飞机");

    }
}

class Vehicle2{
    public void runRoad(String msg){
        System.out.println(msg+"跑在道上");
    }
    public void runWater(String msg){
        System.out.println(msg+"走水路");
    }
}