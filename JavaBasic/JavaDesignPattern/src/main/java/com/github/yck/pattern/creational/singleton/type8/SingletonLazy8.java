package com.github.yck.pattern.creational.singleton.type8;

import com.github.yck.pattern.creational.singleton.type4.Singleton4;

public class SingletonLazy8 {
    public static void main(String[] args) {
        System.out.println(Singleton.INSTANCE.hashCode());
        System.out.println(Singleton.INSTANCE.hashCode());
        Singleton instance = Singleton.INSTANCE.getInstance();
        Singleton instance1 = Singleton.INSTANCE.getInstance();
        instance1.sayHello();
    }
}

enum Singleton{
    INSTANCE;
    public Singleton getInstance(){return INSTANCE;}
    public void sayHello(){
        System.out.println("Hello");
    }
}
