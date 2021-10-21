package mythreadtest;

import java.util.concurrent.locks.ReentrantLock;

/**
 * 使用wait和notify，当到10的倍数时候开始换线程处理
 * 几个要诀：
 * 1、wait，notify都是Object里面的方法。
 * 2、调用者使用syn
 */
class ThreadCommunication implements Runnable{
    private static int count = 100;
    private static Object o = new Object();
    @Override
    public void run() {
        while(true){
            synchronized (o){
                o.notify();
                if(count > 0){
                    System.out.println(Thread.currentThread().getName()
                    +":"+count);
                    count --;
                    if(count % 10 == 0){
                        try {
                            o.wait(100);
                        } catch (InterruptedException e) {
                            e.printStackTrace();
                        }
                    }
                }else break;
            }


        }
    }
}
public class ThreadCommunicationTest {
    public static void main(String[] args) {
        ThreadCommunication tc = new ThreadCommunication();
        Thread thread = new Thread(tc);
        thread.setName("Thread1");
        thread.start();

        Thread thread2 = new Thread(tc);
        thread2.setName("Thread2");
        thread2.start();
        Thread thread3 = new Thread(tc);
        thread3.setName("thread3");
        thread3.start();
    }
}
