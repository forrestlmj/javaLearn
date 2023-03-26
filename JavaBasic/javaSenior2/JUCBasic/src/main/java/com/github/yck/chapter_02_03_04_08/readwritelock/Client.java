package com.github.yck.chapter_02_03_04_08.readwritelock;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class Client {
    public static void main(String[] args) {
//        testMyCache(new MyCache(),3);
//        testMyCacheDefinitelySafe(new MyCacheNotDefinitelySafe());
        testMyCacheDefinitelySafe(new MyCacheDefinitelySafe());
    }

    private static void testMyCacheDefinitelySafe(Cache m) {

        new Thread(()->{
            while (true){
                m.put("abc","True");
                try {
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                    throw new RuntimeException(e);
                }
            }
        },m.getClass().getSimpleName()+"-1").start();

        new Thread(()->{
            while (true){
                m.put("abc","False");
                try {
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                    throw new RuntimeException(e);
                }
            }
        },"MyCacheDefinitelySafe-2").start();
    }

    private static void testMyCache(Cache c,Integer ReadWriteThreadNumber) {
        Random r = new Random();

        List<Thread> l = new ArrayList<>();
        for (int i = 0; i < ReadWriteThreadNumber; i++) {
            l.add(new Thread(()->{
                for (int j = 0; j < 50; j++) {
                    String s = String.valueOf(r.nextInt(100));
                    c.put(s,s);
                }
            },"Write-Thread"+i));
        }
        for (int i = 0; i < ReadWriteThreadNumber; i++) {
            l.add(new Thread(()->{
                for (int j = 0; j < 50; j++) {
                    String s = String.valueOf(r.nextInt(100));
                    c.get(s);
                }
            },"Read-Thread"+i));
        }

        l.forEach(o->o.start());
    }

}
