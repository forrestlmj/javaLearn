package com.github.yck.principle.dependencyInvision.improve.threeway;

/**
 * 使用Setter方法进行依赖传递
 *
 */
public class PassBySetter {
    public static void main(String[] args) {
        OpenAndClose3 o3 = new OpenAndClose3();
        o3.set(new Xiaomi3());
        o3.open();

        o3.set(new ChangHong3());
        o3.open();
    }
}
interface Itv3{void play();}
class Xiaomi3 implements Itv3{

    @Override
    public void play() {
        System.out.println("Xiaomi3 is opened.");
    }
}
class ChangHong3 implements Itv3{

    @Override
    public void play() {
        System.out.println("ChangHong3 is opened.");
    }
}
interface IOpenAndClose3{void open();void set(Itv3 itv3);}
class OpenAndClose3 implements IOpenAndClose3{
    private Itv3 itv3;
    @Override
    public void open() {
        itv3.play();
    }

    @Override
    public void set(Itv3 itv3) {
        this.itv3 = itv3;
    }
}