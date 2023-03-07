package com.atguigu;


class Test4 extends Thread{
    private static int tickets = 100;
    @Override
    public void run() {
        while(true){
            show();
        }
    }

    private static synchronized void show() {
        if(tickets>0){
            try {
                sleep(100);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            System.out.println(Thread.currentThread().getName()+"->"+tickets);
            tickets --;
        }

    }
}
public class WindowTest4 {
    public static void main(String[] args) {
        Test4 t1 = new Test4();
        Test4 t2 = new Test4();
        Test4 t3 = new Test4();
        t1.setName("窗口1");
        t2.setName("窗口2");
        t3.setName("窗口3");
        t1.start();
        t2.start();
        t3.start();
    }
}
