package com.github.yck.chapter_06_callable.completable_future;

import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;

public class CompletableFutureTest {
    public static void main(String[] args) throws ExecutionException, InterruptedException {

//        test1();
        test2();

    }

    private static void test1() throws ExecutionException, InterruptedException {
        CompletableFuture<Void> c1 = CompletableFuture.runAsync(() -> {
            System.out.println(Thread.currentThread().getName() + ":" + CompletableFuture.class.getName());
        });
        System.out.println(c1.get());
    }

    private static void test2() {
        CompletableFuture<String > u = CompletableFuture.supplyAsync(() -> {

            for (int i = 0; i < 5; i++) {
                try {
                        TimeUnit.SECONDS.sleep(1);
                } catch (InterruptedException e) {
                    throw new RuntimeException(e);
                }
                System.out.println(Thread.currentThread().getName()+"运行中..");
            }
            return "Done";
        });

        try {
            System.out.println(Thread.currentThread().getName()+":"+u.whenComplete((t, x) -> {
                System.out.println(Thread.currentThread().getName() +":"+ t);
            }).get());
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        } catch (ExecutionException e) {
            throw new RuntimeException(e);
        }
    }

}
