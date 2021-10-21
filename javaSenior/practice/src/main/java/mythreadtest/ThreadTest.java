package mythreadtest;

import org.junit.Test;


public class ThreadTest {

    public static void main(String[] args){
        Runnable t = () -> {
            while (true){
                try {
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                System.out.println("This is from "+Thread.currentThread().getName());
            }
        };

        Thread t1 = new Thread(t);
        t1.setName("线程1");
        t1.start();
        t1.setPriority(1);

        Thread t2 = new Thread(t);
        t2.setName("线程2");
        t2.setPriority(9);
        t2.start();
    }
}
