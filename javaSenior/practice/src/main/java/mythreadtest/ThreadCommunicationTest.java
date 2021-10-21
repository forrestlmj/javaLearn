package mythreadtest;

import java.util.concurrent.locks.ReentrantLock;

/**
 * 使用wait和notify，当到10的倍数时候开始换线程处理
 * 几个要诀：
 * 1、wait，notify都是Object里面的方法。
 * 2、调用者使用syn
 */
class ThreadCommunication implements Runnable{
    private static int count = 150;
    private static Object o = new Object();
    @Override
    public void run() {
        while(true){
            synchronized (o){
                o.notify();
                if(count > 0){
                    if(count % 10 == 0){
                        try {
                            o.wait(;
                        } catch (InterruptedException e) {
                            e.printStackTrace();
                        }
                    }
                    count --;
                }else break;
            }


        }
    }
}
public class ThreadCommunicationTest {
    public static void main(String[] args) {

    }
}
