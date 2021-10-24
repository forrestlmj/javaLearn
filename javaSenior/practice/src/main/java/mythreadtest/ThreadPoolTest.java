package mythreadtest;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadPoolExecutor;

public class ThreadPoolTest {
    public static void main(String[] args) {
        ExecutorService service = Executors.newFixedThreadPool(8);
        ThreadPoolExecutor e = (ThreadPoolExecutor) service;
        e.execute(() -> {
            while (true) {
                for (int i = 0; i < 100; i++) {
                    System.out.println(Thread.currentThread().getName()
                    +i);
                    try {
                        Thread.sleep(100);
                    } catch (InterruptedException interruptedException) {
                        interruptedException.printStackTrace();
                    }
                }
            }
        });
        e.execute(System.out::println);
        e.shutdown();
    }
}
