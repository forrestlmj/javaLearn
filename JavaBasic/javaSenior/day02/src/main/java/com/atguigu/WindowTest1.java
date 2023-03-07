package com.atguigu;

class Test1 implements Runnable{
    private static int tickets = 100;
    private static Object o = new Object();
    @Override
    public void run(){
        while(true){
            synchronized(Test1.class){
                if(tickets > 0){
//                    try {
//                        Thread.sleep(50);
//                    } catch (InterruptedException e) {
//                        e.printStackTrace();
//                    }
                    System.out.println(Thread.currentThread().getName()+":->"+tickets);
                    tickets --;
                }
            }

        }
    }

}
public class WindowTest1 {
    public static void main(String[] args) {
        Test2 test2 = new Test2();
        Test2 test3 = new Test2();
        Thread t1 = new Thread(test2);
        Thread t2 = new Thread(test3);
        Thread t3 = new Thread(test2);

        t1.setName("窗口1");
        t2.setName("窗口2");
        t3.setName("窗口3");

        t1.start();
        t2.start();
        t3.start();
    }
}
