import static java.lang.Thread.sleep;

/**
 * 多个人玩球,多线程
 * 互相传球,球是 对象监视器
 */
class Game implements Runnable{
    private int round = 1;
    private Object ball = new Object();
    @Override
    public void run() {
        while (true){
            synchronized (ball){
                ball.notify();
                if(round<=20){
                    System.out.println(Thread.currentThread().getName()+
                            "get the ball at "+String.valueOf(round)+"round");
                    try {
                        sleep(500);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                    round ++;
                    try {
                        ball.wait();
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }else break;
            }
        }
        
    }
}
public class PlayBall {
    public static void main(String[] args) {
        Game g = new Game();
        Thread t1 = new Thread(g);
        Thread t2 = new Thread(g);
        Thread t3 = new Thread(g);
        Thread t4 = new Thread(g);

        t1.setName("队长");
        t1.setPriority(10);
        t2.setName("球员2");
        t3.setName("球员3");
        t4.setName("球员4");
        t4.setPriority(1);

        t1.start();
        t2.start();
        t3.start();
        t4.start();

    }
}
