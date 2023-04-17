package com.yck.test.memoryleakcases;

import javax.swing.*;
import java.util.*;
import java.util.concurrent.TimeUnit;
//-Xmx8m -Xms8m -XX:SurvivorRatio=1 -XX:NewRatio=1 -XX:-UseAdaptiveSizePolicy -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=E://JVM//MAT//com.yck.test.memoryleakcases._7_CacheOOM.hprof

/**
 * 使用 WeakHashMap 来节省空间
 */
public class _7_CacheOOM {
    static Map wMap = new WeakHashMap();
    private static final int KB = 1024;
    public static void main(String[] args) throws InterruptedException {
//        Map<String,byte[]> c = new HashMap<>();
        // GC 时候会释放缓存
        init();
        testWeakHashMap();

    }
    public static void init() {
        String ref1 = new String("obejct1");
        String ref2 = new String("obejct2");
        String ref3 = new String("obejct3");
        String ref4 = new String("obejct4");
        wMap.put(ref1, "cacheObject1");
        wMap.put(ref2, "cacheObject2");
        System.out.println("String引用ref1，ref2，ref3，ref4 消失");

    }
    public static void testWeakHashMap() throws InterruptedException {

        for (Object o : wMap.entrySet()) {
            System.out.println(o);
        }
        try {
            System.gc();
            TimeUnit.SECONDS.sleep(5);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println("WeakHashMap GC之后");
        for (Object o : wMap.entrySet()) {
            System.out.println(o);
        }
    }
}
