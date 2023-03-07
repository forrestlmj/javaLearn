package com.github.yck.principle.Liskvo;

/**
 * 解决的方法是使用聚合，将A类作为类变量，B类的方法去调用A类
 */
public class LiskvoSubstitution2 {
    public static void main(String[] args) {
        B2 b2 = new B2();
        System.out.println("10 - 9 = " + b2.method1(10,  9));
    }
}

class Base{

}

class A2 extends Base{
    Integer method1(Integer a, Integer b){ return a - b;}
}

class B2 extends Base{
    private A2 a2 = new A2();
    Integer method1(Integer a, Integer b){return a2.method1(a, b);}
    Integer method2(Integer a){return a + 9;}
}