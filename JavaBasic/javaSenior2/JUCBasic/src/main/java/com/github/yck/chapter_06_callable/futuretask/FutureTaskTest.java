package com.github.yck.chapter_06_callable.futuretask;

import java.util.concurrent.ExecutionException;
import java.util.concurrent.FutureTask;

/**
 * 结合 {@link java.util.concurrent.Callable} 与 {@link java.util.concurrent.FutureTask}
 * 实现并行计算的复杂任务。
 *
 * 调用 {@link FutureTask#isDone()} 方法，在主线程中，等待子线程计算完成。
 */
public class FutureTaskTest {
    public static void main(String[] args) throws ExecutionException, InterruptedException {
        FutureTaskTest f = new FutureTaskTest();
        f.test();
    }

    private void test2() {
        System.out.println();
    }

    private void test() throws ExecutionException, InterruptedException {
        Thread.currentThread().setName("主任务");
        long start = System.currentTimeMillis();

        FutureTask<Integer> mapReduce1 = new FutureTask<Integer>(new ComputeBigData(10, "MapReduce1"));
        FutureTask<Integer> mapReduce2 = new FutureTask<Integer>(new ComputeBigData(2, "MapReduce2"));
        FutureTask<Integer> mapReduce3 = new FutureTask<Integer>(new ComputeBigData(5, "MapReduce3"));
        new Thread(mapReduce1,"Thread1").start();
        new Thread(mapReduce2,"Thread2").start();
        new Thread(mapReduce3,"Thread3").start();

        while (true){
            if (mapReduce1.isDone() && mapReduce2.isDone() && mapReduce3.isDone()) {
                break;
            }
        }
        long end = System.currentTimeMillis();
        System.out.println(Thread.currentThread().getName()
        +"计算完成。计算结果：\n"
                +"Thread1$mapReduce1:"+mapReduce1.get()
        +"\nThread1$mapReduce2:"+mapReduce2.get()
        +"\nThread1$mapReduce3:"+mapReduce3.get()
        +"\n总运行时间："+(end-start)/1000.0+"秒");

    }
}

