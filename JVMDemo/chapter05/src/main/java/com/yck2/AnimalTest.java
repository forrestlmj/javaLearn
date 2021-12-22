package com.yck2;


interface Huntable{
    void hunt();
}

class Animal{
    public void eat(){
        System.out.println("动物吃东西");
    }
    public final void sleep(){
        System.out.println("动物总要睡觉");
    }
    public static void die(){
        System.out.println("动物总会消失");
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
