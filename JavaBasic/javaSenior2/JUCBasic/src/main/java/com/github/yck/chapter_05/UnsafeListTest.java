package com.github.yck.chapter_05;

import java.util.*;
import java.util.concurrent.CopyOnWriteArrayList;

/**
 * <h>针对 List 接口进行线程安全的测试，4种方法：</h>
 * <p>
 *     <li>{@link java.util.Vector}: 线程安全，但是使用了 synchronized 重型锁，效率较低。</li>
 *     <li>{@link ArrayList} 线程不安全。当使用多线程去操作 ArrayList 时候，会有一定概率报错。</li>
 *     <li>{@link Collections#synchronizedList(List)} 线程安全。该方法中会将 {@link ArrayList} 转换为一个静态内部类，
 *     这个静态内部类 简单粗暴的将所有 add 等写操作加 synchronized 重型锁。
 *     </li>
 *
 *     <li>{@link CopyOnWriteArrayList} 线程安全。
 *     有如下特点：
 *     <ol>1、适合读多改少以及数组特别小的情况。因为涉及到写操作时候，会复制一份新的数组(Object[] array)；
 *     等写完之后，将指针指向新数组，之前的数组废弃。这意味每发生一次写操作，都会新建一整套数组。如果写操作（假设都是add）发生 N 次，那么
 *     就会生成 N 个数组对象，以及 N^2 / 2 个对象，可以理解为空间复杂度为 O(N^2)。而其他 List 类底层都是一个 (Object[] array)，每次
 *     写操作涉及的复制都是调用 native 方法进行原地赋值，所以空间复杂度为 O(N)。两者差距巨大。
 *     <ol/>。
 *     <ol>2、</ol>
 *     <ol>3、用到了 {@link java.util.concurrent.locks.ReentrantLock} 来保证
 *  *     {@link CopyOnWriteArrayList#add(Object) 写写互斥和读写互斥}。</ol>
 *     <ol></ol>
 *     <ol></ol>
 *
 * </p>
 *
 * <pre>
 * @see ArrayList 中的 checkForComodification方法，使用 mod 方法来检测是否为多线程操作。
 * 如果检测出线程安全问题直接抛出
 * </pre>
 *
 *
 */
public class UnsafeListTest {
    public static void main(String[] args) {
        UnsafeListTest u = new UnsafeListTest();
//        u.testUnSafe(new ArrayList<>());
//        u.testUnSafe(new Vector<>());
        u.testUnSafe(Collections.synchronizedList(new ArrayList<>()));
//        u.testUnSafe(new CopyOnWriteArrayList<>());

        u.testOOM(new CopyOnWriteArrayList<>());
    }


    /**
     * 测试 {@link ArrayList} 时候，出现异常是个概率问题，加while时候，就不报异常
     */
    public void testUnSafe(List<String>  a){
        for (int i = 0; i < 2; i++) {
            new Thread(() -> {
                    for (int j = 0; j < 100; j++) {
                        a.add(UUID.randomUUID().toString().substring(0,8));
                    }
                    System.out.println(Thread.currentThread().getName()
                            +" a' length:"+a);
            },String.valueOf(i)).start();
        }
    }
    /**
     * 这里 JProfile
     * 对比 {@link CopyOnWriteArrayList} 与 {@link ArrayList}
     * 在频繁写操作时的内存使用情况
     *
     *  {@link CopyOnWriteArrayList} 会完全复制一份当前数据再进行操作，
     *  因此这个方法一定会疯狂产生大量垃圾
     *
     * @param
     */
    public void testOOM(List<String> a){
        List<String > list = new ArrayList<>();
        for (int i = 0; i <30; i++) {
           new Thread(()->{
               //向集合添加内容
                list.add(UUID.randomUUID().toString().substring(0,8));
                //从集合获取内容
               System.out.println(list);
           },String.valueOf(i)).start();
       }
    }


}
