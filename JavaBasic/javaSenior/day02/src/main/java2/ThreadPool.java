import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadPoolExecutor;

class NumberThread implements Runnable{
    @Override
    public void run() {
        while(true){
            for (int i = 0; i < 100; i++) {
                if(i%2 == 0) System.out.println(Thread.currentThread().getName()+""+i);
            }
        }
    }
}
class Number1Thread implements Runnable{
    @Override
    public void run() {
        while(true){
            for (int i = 0; i < 100; i++) {
                if(i%2 == 1) System.out.println(
                    Thread.currentThread().getName()+"->"+i
                );
            }
        }
    }
}
public class ThreadPool {
    public static void main(String[] args) {
        ExecutorService service = Executors.newFixedThreadPool(10);
        ThreadPoolExecutor e = (ThreadPoolExecutor) service;
        service.execute(new Number1Thread());
        service.execute(new NumberThread());

        service.shutdown();
    }
}
