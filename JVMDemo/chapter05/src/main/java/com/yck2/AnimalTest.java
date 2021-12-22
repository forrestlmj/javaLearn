package com.yck2;


interface Huntable{
    void hunt();
}

class Animal{
    public void eat(){
        System.out.println("动物吃东西");
    }

    /**
     *  0 aload_0
     *  1 invokespecial #5 <com/yck2/Animal.methodPrivate : ()V>
     *  4 invokestatic #6 <com/yck2/Animal.methodStatic : ()V>
     *  7 getstatic #2 <java/lang/System.out : Ljava/io/PrintStream;>
     * 10 ldc #7 <动物总要睡觉>
     * 12 invokevirtual #4 <java/io/PrintStream.println : (Ljava/lang/String;)V>
     * 15 return
     *
     * 其中第1和4为invokespecial，invokestatic，这里就是早期绑定+静态绑定。
     */
    public final void sleep(){
        methodPrivate();
        methodStatic();

        System.out.println("动物总要睡觉");
    }
    public static void methodStatic(){
        System.out.println("动物总会消失");
    }
    private void methodPrivate(){

    }
}

class Dog extends Animal implements Huntable{

    @Override
    public void hunt() {
        System.out.println("狗拿耗子，多管闲事");
    }
    @Override
    public void eat(){
        System.out.println("狗吃骨头");
    }

}

class Cat extends Animal implements Huntable{
    public Cat(){
        super(); // 早期绑定
    }
    public static void miao(){
        System.out.println("Miao");
    }

    public Cat(String name){
        this();// 早期绑定
    }

    @Override
    public void eat(){
        System.out.println("猫吃鱼");
    }

    @Override
    public void hunt() {
        System.out.println("猫拿耗子，天经地义");
    }
}


public class AnimalTest {
    public void showAnimal(Animal animal){
        animal.eat();
    }
    public void showHunt(Huntable huntable){
        huntable.hunt();
    }
}
