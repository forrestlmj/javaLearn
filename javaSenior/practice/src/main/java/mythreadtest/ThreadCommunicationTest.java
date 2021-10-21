package mythreadtest;

import java.util.concurrent.locks.ReentrantLock;

/**
 * 使用wait和notify，当到10的倍数时候开始换线程处理
 * 几个要诀：
 * 1、wait，notify都是Object里面的方法。
 * 2、调用者使用synchronized先抢到锁。
 * 3、抢到锁后先notify其他一个人，让一个别人准备好，然后执行。
 * 4、执行吃干抹净后，原地wait休息一下
 * sleep()不释放同步锁,wait()释放同步锁.
 * notify()：随机唤醒等待队列中等待同一共享资源的一个线程，并使该线程退出等待队列，进入可运行状态，也就是notify()方法仅通知一个线程。
 *
 * notifyAll()：使所有正在等待队列中等待同一共享资源的全部线程退出等待队列，进入可运行状态。此时，优先级最高的那个线程最先执行，但也有可能是随机执行，这取决于JVM虚拟机的实现。
 * ————————————————
 * 版权声明：本文为CSDN博主「全菜工程师小辉」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
 * 原文链接：https://blog.csdn.net/y277an/article/details/98697454
 */
class ThreadCommunication implements Runnable{
    private static int count = 100;
    private static Object o = new Object();
    @Override
    public void run() {
        //132 312 312 312 312 312 31
        while(true){
            synchronized (o){
                o.notify();

                System.out.println(Thread.currentThread().getName()+"抢到了碗，并通知其他人待命");

                if(count > 0){
                    System.out.println(Thread.currentThread().getName()
                    +":"+count);
                    count --;
                    if(count % 5 == 0){
                        try {
                            System.out.println(Thread.currentThread().getName()+"休息会，让出了碗");

                            o.wait();

                        } catch (InterruptedException e) {
                            e.printStackTrace();
                        }
                        System.out.println(Thread.currentThread().getName()+"被notify醒来了，开始抢碗");

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
        thread.start();
        Thread thread2 = new Thread(tc);
        thread2.start();
        Thread thread3 = new Thread(tc);
        thread3.start();

        Thread thread6 = new Thread(tc);
        thread6.start();
        Thread thread7 = new Thread(tc);
        thread7.start();
        Thread thread8 = new Thread(tc);
        thread8.start();
    }
}
