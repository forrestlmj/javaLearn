package com.github.yck.principle.dependencyInvision.improve.threeway;

/**
 * 通过方法中的参数传递依赖关系 。
 * 我认为非常灵活，只需要一个OpeaAndClose对象，
 * 根据多态，可以open多个接口实现类
 */
public class PassByMethod1 {
    public static void main(String[] args) {
        OpenAndClose o = new OpenAndClose();
        o.open(new ChangHong());
        o.open(new Xiaomi());
    }
}
interface IOpenAndClose {void open(ITV t);}
interface ITV {void play();}

class ChangHong implements ITV{
    @Override
    public void play() {
        System.out.println("ChangHong is open");
    }
}
class Xiaomi implements ITV{

    @Override
    public void play() {
        System.out.println("Xiaomi is open");
    }
}

class OpenAndClose implements IOpenAndClose{

    @Override
    public void open(ITV t) {
        t.play();
    }
}