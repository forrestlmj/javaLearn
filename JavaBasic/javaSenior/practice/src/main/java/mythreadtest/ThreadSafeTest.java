package mythreadtest;
class ThreadSafe implements Runnable{
    private static Integer count = 300000000;
    private static Object o = new Object();
    @Override
    public void run() {
        while(true){
            //https://www.cnblogs.com/williamjie/p/9466941.html
            //现象是连续一个线程在十几毫秒内都是连续能抢到的,可能和时间片有关,由于sleep不释放锁,所以,
            //即使是sleep,在之前时间片中抢到了就是抢到了,也会体现一个线程连续拿到一段时间的监视器
            synchronized (o){
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
}
public class ThreadSafeTest {
    public static void main(String[] args) {
        ThreadSafe threadSafe = new ThreadSafe();
        ThreadSafe threadSafe2 = new ThreadSafe();
        Thread thread = new Thread(threadSafe);
        thread.start();
        thread.setName("Thread1");
        thread.setPriority(10);
        Thread thread2 = new Thread(threadSafe2);
        thread2.start();
        thread2.setName("Thread2");
        thread2.setPriority(9);
        Thread t3 = new Thread(threadSafe);
        t3.setName("线程3");
        t3.start();

        Thread t4 = new Thread(threadSafe);
        t4.setName("线程4");
        t4.start();

        Thread t5 = new Thread(threadSafe);
        t5.setName("线程5");
        t5.start();
    }
}
