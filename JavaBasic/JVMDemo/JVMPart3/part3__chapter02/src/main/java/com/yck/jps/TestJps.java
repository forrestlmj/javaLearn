package com.yck.jps;

public class TestJps {
    public static void main(String[] args) throws InterruptedException {
        new Thread(()->{
            while (true){
                System.out.println(Thread.currentThread().getName()+"is sleeping");
                try {
                    Thread.sleep(3000);
                } catch (InterruptedException e) {
                    throw new RuntimeException(e);
                }
            }
        },"Thread1").start();
        new Thread(()->{
            while (true){
                System.out.println(Thread.currentThread().getName()+"is sleeping");
                try {
                    Thread.sleep(3000);
                } catch (InterruptedException e) {
                    throw new RuntimeException(e);
                }
            }
        },"Thread2").start();
    }
}
