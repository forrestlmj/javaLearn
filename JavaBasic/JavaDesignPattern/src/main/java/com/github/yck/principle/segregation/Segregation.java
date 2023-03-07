package com.github.yck.principle.segregation;

/**
 * AC类实现了
 */
public class Segregation {
    public static void main(String[] args) {
        A a = new A();
        a.depend1(new B());
        a.depend2(new B());
        a.depend3(new B());

        C c = new C();
        c.depend1(new D());
        c.depend4(new D());
        c.depend5(new D());

    }
}

interface Interface1{
    void method1();
    void method2();
    void method3();
    void method4();
    void method5();
}
class A{
    public void depend1(Interface1 i){ i.method1(); }
    public void depend2(Interface1 i){ i.method2(); }
    public void depend3(Interface1 i) {
        i.method3();
    }
}

class B implements Interface1{

    @Override
    public void method1() {
        System.out.println("B 实现了 operation1");
    }

    @Override
    public void method2() {
        System.out.println("B 实现了 operation2");
    }

    @Override
    public void method3() {
        System.out.println("B 实现了 operation3");
    }

    @Override
    public void method4() {
        System.out.println("B 实现了 operation4");
    }

    @Override
    public void method5() {
        System.out.println("B 实现了 operation5");

    }
}

class C{
    public void depend1(Interface1 i){i.method1();}
    public void depend4(Interface1 i){i.method4();}
    public void depend5(Interface1 i){i.method5();}
}
class D implements Interface1{

    @Override
    public void method1() {
        System.out.println("D 实现了 operation1");
    }

    @Override
    public void method2() {
        System.out.println("D 实现了 operation2");
    }

    @Override
    public void method3() {
        System.out.println("D 实现了 operation3");
    }

    @Override
    public void method4() {
        System.out.println("D 实现了 operation4");
    }

    @Override
    public void method5() {
        System.out.println("D 实现了 operation5");
    }
}

