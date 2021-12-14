package lambdatest;

import org.junit.Test;

public class MyLambdaTest {
    @Test
    public void testLambda(){
        Runnable r = () -> {
            int i = 0;
            while (true){
                try {
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                System.out.println("hello"+i);
                i++;
            }
        };
        r.run();
    }

    public static void main(String[] args) {
        Thread thread = new Thread(() -> {
            for (int i = 0; i < 10; i++) {
                System.out.println(i + ":i");
            }
        });
        thread.start();

        Runnable r = () -> {
            for (int i = 10; i > 0; i--) {
                System.out.println("i:"+i);
                try {
                    Thread.sleep(100);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        };
        r.run();
    }
}
