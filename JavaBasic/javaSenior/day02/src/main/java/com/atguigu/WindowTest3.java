package com.atguigu;

class Test3 implements Runnable{
    private static int tickets = 100;
    @Override
    public void run() {
        while(true){
            show();
        }
    }

    private synchronized void show()  {
            try {
                Thread.sleep(50);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            if(tickets > 0) {
                System.out.println(Thread.currentThread().getName()+"->"+tickets);
                tickets --;
            }
    }
}
public class WindowTest3 {
    public static void main(String[] args) {
        Test3 test3 = new Test3();
        Thread t1 = new Thread(test3);
        Thread t2 = new Thread(test3);
        Thread t3 = new Thread(test3);
        t1.setName("窗口1");
        t2.setName("窗口2");
        t3.setName("窗口3");

        t1.start();
        t2.start();
        t3.start();
    }
}
