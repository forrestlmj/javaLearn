package com.github.yck.chapter_10_threadpool;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.concurrent.*;

public class ThreadPoolTest {
    public static void main(String[] args) {
        new ThreadPoolTest().test();
    }
    class Task implements Runnable{
        private BlockingQueue<String> bq;

        Task(BlockingQueue<String> bq) {
            this.bq = bq;
        }

        @Override
        public void run() {
            Random r = new Random();
            while (true){
                String message = "Data:"+r.nextInt(100)+" added by "+Thread.currentThread().getName();
                try {
                    bq.put(message);
                    TimeUnit.SECONDS.sleep(1);
                } catch (InterruptedException e) {
                    throw new RuntimeException(e);
                }
            }
        }
    }
    public void test (){
        BlockingQueue<String> bq = new LinkedBlockingQueue<>();
        ExecutorService producers = Executors.newFixedThreadPool(5);
        producers.execute(new Task(bq));
        producers.execute(new Task(bq));
        producers.execute(new Task(bq));

        ExecutorService consumer = Executors.newSingleThreadExecutor();
        consumer.execute(()->{
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
            while (true){
                try {
                    System.out.println(
                    sdf.format(new Date())+" ["+Thread.currentThread().getName()+"] Consume data '"+
                            bq.take()+"'"
                    );
                } catch (InterruptedException e) {
                    throw new RuntimeException(e);
                }
            }
        });
    }
}
