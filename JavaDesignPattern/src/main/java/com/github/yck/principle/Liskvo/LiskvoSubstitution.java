package com.github.yck.principle.Liskvo;

/**
 * 里氏替换原则，告诉我们，子类不要改写父类的方法，否则导致调用时候产生未知效果
 */
public class LiskvoSubstitution {
    public static void main(String[] args) {
//        A a = new A();
//        a
        B b = new B();
        System.out.println("10 - 4 = "+b.method1(10, 4));
    }
}
class A{
    public Integer method1(Integer a, Integer b){
        return a-b;
    }
}

class B extends A{
    @Override
    public Integer method1(Integer a, Integer b) {
        return a + b;
    }
    public Integer method2(Integer a){
        return a +9;
    }
}