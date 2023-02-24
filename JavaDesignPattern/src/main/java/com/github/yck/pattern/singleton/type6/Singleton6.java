package com.github.yck.pattern.singleton.type6;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * 懒汉模式 - 双重检查（推荐）
 * 先在非同步情况下，使用null检查，解决之后已经有单例的可能性
 *  再使用同步代码块，再正式处理null问题，接下来就是非空赋值
 */
public class Singleton6 {
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
 * 双重检查
 */
class SingletonLazy3 {

    private static volatile SingletonLazy3 singletonLazy3;

    private SingletonLazy3(){}

    /**
     * @return
     */
    public static SingletonLazy3 getInstance(){
        if ( singletonLazy3 == null ){
            synchronized (SingletonLazy3.class){
                if (singletonLazy3 == null){
                    singletonLazy3 = new SingletonLazy3();
                }
            }
        }
        return singletonLazy3;
    }


}
