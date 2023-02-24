package com.github.yck.pattern.singleton.type3;

import java.util.*;

/**
 * 懒汉模式线程不安全版本，
 *
 */
public class Singleton3 {
    public static void main(String[] args) {
//        System.out.println(SingletonLazy3.getInstance().hashCode());
//        System.out.println(SingletonLazy3.getInstance().hashCode());

        List<Thread> threads = new ArrayList<>();
        for (int i = 0; i < 50; i++) {
            Thread t = new Thread(new Runner());
            threads.add(t);
        }
        threads.forEach(Thread::start);
    }
}

/**
 * 这里是一个测试类，
 * 其中 HashSet 是线程安全的，调用 SingletonLazy 不是线程安全的。
 */
class Runner implements Runnable{
    private static Set<Integer> set = new HashSet<>();
    @Override
    public void run() {
        SingletonLazy3 instance = SingletonLazy3.getInstance();
        System.out.println(instance.hashCode());
            synchronized (Runner.class){
                set.add(instance.hashCode());
                System.out.println(set);
            }
    }
}

/**
 * 线程不安全
 */
class SingletonLazy3 {
    private static SingletonLazy3 singletonLazy3;

    private SingletonLazy3(){}

    /**
     * @return 这里线程不安全，有 if 时候，多线程进入 if 后
     * 就不是一个实例喽
     */
    public static SingletonLazy3 getInstance(){
        if ( singletonLazy3 == null ){
            singletonLazy3 = new SingletonLazy3();
        }
        return singletonLazy3;
    }


}
