package com.github.yck.principle.dependencyInvision.improve.threeway;

/**
 * 相比较于按照按照方法产地依赖，
 * 构造器和set方法都比较不灵活。
 * 因为它把要调用的类的接口做为了类变量，而类变量只有一个，
 * 想要换一个调用类 ，必须要通过set方法改变这个类变量
 */
public class PassByConstructor2 {
    public static void main(String[] args) {
        OpenAndClose2 o2 = new OpenAndClose2(new ChangHong2());
        o2.open();
        OpenAndClose2 o2_2 = new OpenAndClose2(new Xiaomi2());
        o2_2.open();
    }
}
interface IOpenAndClose2{void open();}
interface ITV2{void play();}

class ChangHong2 implements ITV2{
    @Override
    public void play() {
        System.out.println("ChangHong2 is opened.");
    }
}

class Xiaomi2 implements ITV2{
    @Override
    public void play() {
        System.out.println("Xiaomi2 is opened.");
    }
}

class OpenAndClose2 implements IOpenAndClose2{
    private ITV2 itv;
    public OpenAndClose2(ITV2 itv1) {
        this.itv = itv1;
    }

    @Override
    public void open() {
        itv.play();
    }
}
