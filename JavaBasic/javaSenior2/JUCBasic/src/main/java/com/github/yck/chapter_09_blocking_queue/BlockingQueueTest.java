package com.github.yck.chapter_09_blocking_queue;

import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;

public class BlockingQueueTest {
    public static void main(String[] args) {
        BlockingQueue<String> bq = new LinkedBlockingQueue<>();
        new Thread(new Runnable() {
            @Override
            public void run() {
                Integer id = 0;

                while (true){
                    try {
                        TimeUnit.SECONDS.sleep(1);
                        bq.put("Message-"+id++);
                    } catch (InterruptedException e) {
                        throw new RuntimeException(e);
                    }

                }
            }
        },"Producer").start();

        new Thread(()->{
            while (true){
                try {
                    System.out.println(Thread.currentThread().getName()+" receive message: "+bq.take());
                } catch (InterruptedException e) {
                    throw new RuntimeException(e);
                }
            }
        },"consumer").start();
    }
}
