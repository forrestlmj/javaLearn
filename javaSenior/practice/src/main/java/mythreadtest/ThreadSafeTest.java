package mythreadtest;
class ThreadSafe implements Runnable{
    private static Integer count = 30000;
    private static Object o = new Object();
    @Override
    public void run() {
        while(true){
            synchronized (o){
                if(count>0){
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

    }
}
