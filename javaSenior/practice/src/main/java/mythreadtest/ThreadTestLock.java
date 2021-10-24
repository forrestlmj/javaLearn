package mythreadtest;

import java.util.concurrent.locks.ReentrantLock;

/**
 * 在使用idea 做debug的时候，不妨仔细观察下栈帧的 Frame中各个线程的表现。
 * 同时可以打印下快照，可以看出各个线程的Thread.State.*的状态
 */
class ThreadLock implements Runnable{
    private static Integer count = 300000000;
    private ReentrantLock lock = new ReentrantLock();
    @Override
    public void run() {
        while(true){
            try {
                lock.lock();
                if(count>0){
                    System.out.println(Thread.currentThread().getName()+":"+
                            count);
                    count--;
//                    try {
//                        Thread.sleep(10);
//                    } catch (InterruptedException e) {
//                        e.printStackTrace();
//                    }

                }else break;
            }finally {
                // 必须放在这里，放在外边会导致结束不了
                lock.unlock();

            }
//            lock.unlock();


        }
    }
}
public class ThreadTestLock {
    public static void main(String[] args) {
        ThreadLock threadLock = new ThreadLock();
        Thread thread = new Thread(threadLock);
        thread.start();
        thread.setName("Thread1");
        thread.setPriority(10);
        Thread thread2 = new Thread(threadLock);
        thread2.start();
        thread2.setName("Thread2");
        thread2.setPriority(9);
    }
}
