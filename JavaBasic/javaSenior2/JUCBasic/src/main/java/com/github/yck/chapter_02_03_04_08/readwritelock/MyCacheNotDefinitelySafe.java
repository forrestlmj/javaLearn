package com.github.yck.chapter_02_03_04_08.readwritelock;

import java.util.HashMap;
import java.util.Map;

/**
 * 这里把 cache 放到 put 的局部变量中，
 * 那么多线程时候，一定就是线程安全的。
 * 因为线程独享栈中的本地变量，这是java最基本知识。
 */
public class MyCacheNotDefinitelySafe implements Cache {
    Map<String,String> m =  new HashMap<>();

    @Override
    public void put(String k, String v) {

        m.put(k,v);
        System.out.println(Thread.currentThread()
                .getName()+"'s HashMap's hashCode is"+m.hashCode());
        System.out.println(Thread.currentThread()
                .getName()+"data:"+m
        );

    }

    @Override
    public String get(String k) {
        return null;
    }
}
