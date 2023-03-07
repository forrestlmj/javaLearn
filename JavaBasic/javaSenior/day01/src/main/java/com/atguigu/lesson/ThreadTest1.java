package com.atguigu.lesson;


import static java.lang.Thread.sleep;

class MyThread2 implements Runnable{
    @Override
    public void run() {
        for(int i = 0; i< 1000000000; i++){
            System.out.println(Thread.currentThread().getName()+"--->"+i);
            try {
                sleep(1);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}
public class ThreadTest1 {
    public static void main(String[] args) {
        MyThread2 myThread2 = new MyThread2();
        Thread t1 = new Thread(myThread2);
        t1.setName("线程1");
        t1.start();
        t1.setPriority(1);

        Thread t2 = new Thread(myThread2);
        t2.setName("线程2");
        t2.setPriority(9);
        t2.start();
    }
}
