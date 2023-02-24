package com.github.yck.pattern.singleton.type8;

public class SingletonLazy8 {
    public static void main(String[] args) {
        System.out.println(Singleton.INSTANCE.hashCode());
        System.out.println(Singleton.INSTANCE.hashCode());
    }
}

enum Singleton{
    INSTANCE;
    public Singleton getInstance(){return INSTANCE;}
}
