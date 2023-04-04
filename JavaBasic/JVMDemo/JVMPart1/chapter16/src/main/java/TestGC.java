import java.util.ArrayList;
import java.util.List;

/**
 * -Xms50m -Xmx50m -XX:+PrintGCTimeStamps -XX:+PrintGCDateStamps -XX:+PrintGCDetails -Xloggc:./log/gc.log
 */
public class TestGC {
    private static final int _1MB = 1024 * 1024;
    private static List<Object> c = new ArrayList<>();
    public static void main(String[] args) throws InterruptedException {
        while(true){
            System.out.println("+ 4M");
//            byte[] bytes1 = new byte[2 * _1MB];
//            byte[] bytes2 = new byte[2 * _1MB];
//            byte[] bytes3 = new byte[2 * _1MB];
            byte[] bytes4 = new byte[4 * _1MB];
            c.add(bytes4);
            Thread.sleep(1000);
        }

    }
}
