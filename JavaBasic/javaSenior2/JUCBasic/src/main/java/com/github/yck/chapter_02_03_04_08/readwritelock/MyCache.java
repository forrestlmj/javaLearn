package com.github.yck.chapter_02_03_04_08.readwritelock;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

/**
 * 使用读写锁来保证线程安全。
 * 其中 读锁 用于 get 方法，保证读读共享
 * 写锁 用于 put 方法，保证写写互斥、读写互斥
 */
public class MyCache implements Cache {
    private Map<String,String > m = new HashMap<>();
    private ReadWriteLock rwLock = new ReentrantReadWriteLock();
    @Override
    public void put(String k, String v) {
        rwLock.writeLock().lock();
        try {


            System.out.println(Thread.currentThread().getName()+" 开始 写操作"+k);

            Thread.sleep(20);
            m.put(k,v);

            System.out.println(Thread.currentThread().getName()+" 完成 写操作:"+m);

        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        } finally {
            rwLock.writeLock().unlock();
        }

    }

    @Override
    public String get(String k) {
        String v = "";
        rwLock.readLock().lock();
        try {
            System.out.println(Thread.currentThread().getName()+" 开始 读操作"+k);

            Thread.sleep(20);
            v = m.getOrDefault(k,"");
            System.out.println(Thread.currentThread().getName()+" 完成 读操作"+k);

        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        } finally {
            rwLock.readLock().unlock();
        }

        return v;
    }
}
