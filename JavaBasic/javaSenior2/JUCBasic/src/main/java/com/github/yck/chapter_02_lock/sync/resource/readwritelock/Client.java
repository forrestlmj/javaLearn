package com.github.yck.chapter_02_lock.sync.resource.readwritelock;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class Client {
    public static void main(String[] args) {
        testMyCache(new MyCache(),3);
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
