package com.github.yck.pattern.singleton.type2;

/**
 * 饿汉模式（静态代码块）
 * 与静态变量一样的道理，都是加载到JVM时候进行初始化。
 */
public class Singleton2 {
    public static void main(String[] args) {
        System.out.println(SingletonHunger.getInstance().hashCode());
        System.out.println(SingletonHunger.getInstance().hashCode());

    }
}

class SingletonHunger{
    private static SingletonHunger sh;

    static {
        sh = new SingletonHunger();
    }

    private SingletonHunger(){}

    public static SingletonHunger getInstance(){ return sh; }
}
