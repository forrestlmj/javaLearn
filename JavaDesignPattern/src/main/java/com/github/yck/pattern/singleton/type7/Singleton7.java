package com.github.yck.pattern.singleton.type7;



import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * 使用静态内部类，来进行懒汉式的实例化。
 *  - 静态内部类在JVM加载到方法区时候，不像类变量那样会进行初始化，所以不是饿汉式的。
 *  - JVM在加载类或方法的时候是线程安全的，因此保证了只有一个实例。
 */
public class Singleton7 {
    public static void main(String[] args) {

        List<Thread> threads = new ArrayList<>();
        for (int i = 0; i < 50; i++) {
            Thread t = new Thread(new com.github.yck.pattern.singleton.type7.Runner());
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
        SingletonLazy7 instance = SingletonLazy7.getInstance();
        System.out.println(instance.hashCode());
        synchronized (com.github.yck.pattern.singleton.type7.Runner.class){
            set.add(instance.hashCode());
            System.out.println(set);
        }
    }
}
class SingletonLazy7{
    private SingletonLazy7(){}
    public static SingletonLazy7 getInstance(){return InnerClass.INSTANCE;}
    private static class InnerClass{
        private static final SingletonLazy7 INSTANCE = new SingletonLazy7();
    }
}

