package com.atguigu.lesson;

import java.util.Random;

/**
 *
 */
class MyThread extends Thread{
    private final Random random = new Random();


    @Override
    public void run() {
        for (int i = 0; i < 10000; i++) {
            System.out.println(getName()+" : "+i);
            try {
                sleep(random.nextInt(200));
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}
public class ThreadTest {
    public static void main(String[] args) throws InterruptedException {
        MyThread myThread = new MyThread();
        myThread.setName("thread1");
        MyThread myThread2 = new MyThread();
        myThread2.setName("thread2");
        myThread.start();
        myThread2.start();
        Thread.currentThread().setName("主线程");
        for (int i = 0; i < 1000; i++) {
            System.out.println(Thread.currentThread().getName()+" : "+i);
            Thread.sleep(1000);
        }
        System.out.println("end");
    }
}
