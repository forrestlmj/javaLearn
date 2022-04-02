package reference;

import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

/**
 * Weak reference test.
 * When GC happens, the objects of weak reference will be collated as
 * garbage no matter how the memory space has left.
 */
public class WeakReferenceTest {
    private static final Integer DATA_SIZE_M = 10 * 1024 * 1024;
    // The item that will be put in the cache.
    private static final Integer ITEM_NUMBER = 11;
    public static void main(String[] args) throws InterruptedException {
        Map<Integer, WeakReference<byte[]>> softCache =
                new HashMap<>();
        Integer i = 0;
        Integer k = 0;
        Integer fired = 0;
        Random r = new Random();
        while (true){
            i++;
            k = r.nextInt(ITEM_NUMBER);

            WeakReference<byte[]> data =
                    new WeakReference< byte[]>(new byte[DATA_SIZE_M]);
            Thread.sleep(20);

            if(softCache.containsKey(k)){
                if(softCache.get(k).get() == null){
                    softCache.put(k,data);
                    System.out.println("缓存:     "+k+"之前已清空，重新放入");
                }else {
                    System.out.println("缓存:     "+k+"命中");
                    fired++;
                }
            }else {
                softCache.put(k,data);
                System.out.println("缓存:        "+k+"已经放入");
            }
            System.out.println("当前缓存大小:    "+
                    softCache.values().stream().filter(t -> t.get()!=null).count()
                    +"命中率："+Math.floor((double )fired*100 / i)+"%。"+"命中"+fired+"次，一共放入"+i+"次"
            );

        }

    }
}
