package com.atguigu.lesson;


import java.util.concurrent.TransferQueue;

/**
 * 这里线程安全问题等待解决
 */
class Threadwindow extends Thread{
    private static int ticket = 100;
    @Override
    public void run() {
        while (true){
            if(ticket > 0){
                ticket--;
                try {
                    Thread.sleep(300);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                System.out.println(Thread.currentThread().getName()
                        +"->剩余"+ticket);
            }else break;
        }

//        super.run();
    }
}
public class WindowTest {
    public static void main(String[] args) {
        Threadwindow t1 = new Threadwindow();
        t1.setName("窗口1");
        t1.start();
        Threadwindow t2 = new Threadwindow();
        t2.setName("窗口2");
        t2.start();
        Threadwindow t3 = new Threadwindow();
        t3.setName("窗口3");
        t3.start();
    }
}
