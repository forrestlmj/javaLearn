package com.github.yck.chapter_02_lock.sync;
/**
 * 测试线程不安全2要素 ：
 * 1. 定义资源类，确定谁是被抢夺的资源。（可以是一个对象的类变量或实例变量）
 * 2. 创建多个线程来抢夺。
 *
 *
 * 线程安全几种方式：
 * synchronized 代码段/方法
 *  重型锁：
 *      1. 获取锁的线程执行完了代码块，释放。
 *      2. 线程发生异常，此时 JVM 让线程自动释放锁。
 * lock
 *      1. Lock 不是 Java 语言内置，是一个类。
 *      2. Lock 需要手动释放。
 * volatile
 * @see
 */