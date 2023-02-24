package com.github.yck.pattern.singleton.type1;

/**
 * 饿汉式（静态变量 + 静态方法）
 * 在加载时候时候，就实例化了静态变量。
 * 不管用不用都生成一个，所以叫做饿汉式。
 * 缺点是浪费资源。
 */
public class Singleton1 {
    public static void main(String[] args) {
        SingletonHunger s1 = SingletonHunger.getInstance();
        SingletonHunger s2 = SingletonHunger.getInstance();
        System.out.println(s1.hashCode());
        System.out.println(s2.hashCode());

    }
}

class SingletonHunger{

    private static SingletonHunger sh = new SingletonHunger();
    private SingletonHunger(){

    }
    public static SingletonHunger getInstance(){
        return sh;
    }
}