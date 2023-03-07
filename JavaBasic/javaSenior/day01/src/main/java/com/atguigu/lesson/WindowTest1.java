package com.atguigu.lesson;

import java.util.concurrent.Callable;

import static java.lang.Thread.sleep;

class ThreadWindow2 implements Runnable{
    private static int tickets = 0;
    private static Object o = new Object();
    @Override
    public void run() {
        while(true){
            synchronized (o){
                if (tickets<100){
                    tickets ++;
                    try {
                        sleep(80);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                    System.out.println(Thread.currentThread().getName()+" 对王小宝的爱 达到了百分之 "
                            +tickets+"%");
                }else break;
            }

        }
    }
}
class AB implements Callable{
    @Override
    public Object call() throws Exception {
        return null;
    }
}
public class WindowTest1 {
    public static void main(String[] args) {
        ThreadWindow2 threadWindow2 = new ThreadWindow2();
        Thread t1 = new Thread(threadWindow2);
        t1.setName("杨小胖");
        t1.start();
        Thread t2 = new Thread(threadWindow2);
        t2.setName("杨小宝");
        t2.start();
        Thread t3 = new Thread(threadWindow2);
        t3.setName("杨小屁");
        t3.start();
    }
}
