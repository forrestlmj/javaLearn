package mythreadtest;

import org.junit.Test;
class ThreadUnSafe implements Runnable{
    private static Integer count = 30000;
    private static Object o = new Object();
    @Override
    public void run() {
        while(true){
            //https://www.cnblogs.com/williamjie/p/9466941.html
            //现象是连续一个线程在十几毫秒内都是连续能抢到的,可能和时间片有关,由于sleep不释放锁,所以,
            //即使是sleep,在之前时间片中抢到了就是抢到了,也会体现一个线程连续拿到一段时间的监视器
                if(count>0){
//                    try {
//                        Thread.sleep(300);
//                    } catch (InterruptedException e) {
//                        e.printStackTrace();
//                    }
                    System.out.println(Thread.currentThread().getName()+":"+count);
                    count --;
                }else break;
            }

    }
}

public class ThreadUnsafeTest {

    public static void main(String[] args){
        ThreadUnSafe t = new ThreadUnSafe();
        Thread t1 = new Thread(t);
        t1.setName("线程1");
        t1.start();

        Thread t2 = new Thread(t);
        t2.setName("线程2");
        t2.start();
    }
}
