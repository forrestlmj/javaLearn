import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Scanner;

public class GCRootTest {
    public static void main(String[] args) throws InterruptedException {
        List<Object> a = new ArrayList<>();
        Date d = new Date();
        for (int i = 0; i < 10000; i++) {
//            Thread.sleep(1);
            a.add(("Test"+ i).intern());
        }
        // Now in Heap Walk of JProfile, the ArrayList number is 187
        System.out.println("Run GC?[Y/N]");
        new Scanner(System.in).next();
        System.out.println("Data are all added, please release the data:");
        new Scanner(System.in).next();
        // After set variable 'a' to null, gc will collect the 'a', and
        // release the memory.
        a = null;

        d = null;
        System.gc();
        // Refresh Heap Walk in JProfile, the ArrayList -1 now, that is 186.
        System.out.println("The data are all removed, please the");
        new Scanner(System.in).next();
        System.out.println("end");
    }
}
