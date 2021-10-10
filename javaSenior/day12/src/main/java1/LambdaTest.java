import org.junit.Test;

import java.util.Comparator;

/**
 * Lambda表达式的使用举例
 *
 * @author shkstart
 * @create 2019 上午 11:30
 */
public class LambdaTest {
    @Test
    public void test(){
        Runnable runnable = new Runnable() {

            @Override
            public void run() {
                for (int i = 0; i < 10; i++) {
                    try {
                        Thread.sleep(100);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                    System.out.println("wake up.");
                }
            }
        };
        runnable.run();
        System.out.println("----------");

        Runnable r = () -> {
            for (int i = 0; i < 10; i++) {
                System.out.println("lambda wake up");
            }
        };
        r.run();
    }
    @Test
    public void test2(){
        Comparator<Integer> comparator = new Comparator<Integer>() {

            @Override
            public int compare(Integer o1, Integer o2) {
                return Integer.compare(o1,o2);
            }
        };

        System.out.println(comparator.compare(12, 22));

        System.out.println("-----");
        Comparator<Integer> com = (o1,o2) -> Integer.compare(o1,o2);
        System.out.println(com.compare(100,0)        );
        System.out.println("方法签名");
        Comparator<Integer> com2 = Integer::compare;
        System.out.println(com2.compare(1,1));
    }
}
