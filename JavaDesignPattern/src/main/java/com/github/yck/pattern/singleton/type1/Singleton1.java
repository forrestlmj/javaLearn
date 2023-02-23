package com.github.yck.pattern.singleton.type1;

public class Singleton1 {
    public static void main(String[] args) {
        SingletonHunger s1 = SingletonHunger.getInstance();
        SingletonHunger s2 = SingletonHunger.getInstance();
        System.out.println(s1.hashCode());
        System.out.println(s2.hashCode());

    }
}

class SingletonHunger{
    private SingletonHunger(){

    }
    private static final SingletonHunger s = new SingletonHunger();
    public static SingletonHunger getInstance(){return s;}
}
