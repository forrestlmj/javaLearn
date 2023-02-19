package com.github.yck.principle.segregation.improve;

public class Segregation1 {
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
}
interface Interface2{
    void method2();void method3();
}
class B implements Interface1, Interface2{

    @Override
    public void method1() {
        System.out.println("method1 of B is running");
    }

    @Override
    public void method2() {
        System.out.println("method2 of B is running");
    }

    @Override
    public void method3() {
        System.out.println("method3 of B is running");
    }
}
class A{
    void depend1(Interface1 i1) {i1.method1();}
    void depend2(Interface2 i2) {i2.method2();}
    void depend3(Interface2 i2) {i2.method2();}
}
interface Interface3{
    void method4();void method5();
}
class D implements Interface1, Interface3{

    @Override
    public void method1() {
        System.out.println("method1 of D is running");

    }

    @Override
    public void method4() {
        System.out.println("method4 of D is running");
    }

    @Override
    public void method5() {
        System.out.println("method5 of D is running");
    }
}

class C{
    void depend1(Interface1 i1){i1.method1();}
    void depend4(Interface3 i3){i3.method4();}
    void depend5(Interface3 i3){i3.method5();}
}
