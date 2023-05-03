package com.yck.memoryleak.memoryleakcases;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;
//-Xmx8m -Xms8m -XX:SurvivorRatio=1 -XX:NewRatio=1 -XX:-UseAdaptiveSizePolicy -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=E://JVM//MAT//com.yck.test.memoryleakcases.StaticCollectionVariableOOM.hprof

/**
 * <a href="https://stackoverflow.com/questions/8387989/where-are-static-methods-and-static-variables-stored-in-java">
 *     static种保存的对象在 heap 种，reference 在 metaspace 中</a>
 * @see MemoryLeakTest
 *
 *
 *  * 1. 静态集合类 {@link _1_StaticCollectionVariableOOM}
 *  *  主要体现在，类变量/静态变量是集合时候，被普通方法所使用，那么即使当普通方法已经
 *  *  不再需要这些数据时候，这些数据仍然存储在静态集合变量中。
 *  *  而静态变量的生命期与JVM一样，所以会OOM
 *  * 相关截图见：
 *  * {@link com.yck.memoryleak.cases.Readme}
 */
@Deprecated
public class _1_StaticCollectionVariableOOM {
    private static final int KB = 1024;
    List<byte[]> oomList = new ArrayList<>();
    @Deprecated
    public void oomAdd(){
        oomList.add(new byte[512*KB]);
    }

    /**
     * 在多次使用 {@link _1_StaticCollectionVariableOOM#oomAdd()} 后调用此方法，手动释放。
     */
    public void clearOomList(){
        oomList = new ArrayList<>();
    }


    public static void main(String[] args) throws InterruptedException {
        _1_StaticCollectionVariableOOM c1 = new _1_StaticCollectionVariableOOM();
        int cnt = 0;
        while (true){
            c1.oomAdd();
            cnt ++;
            TimeUnit.SECONDS.sleep(1);
            System.out.println("Add..."+cnt+" times");
            // 添加次数大于 5 时候，进行回收。
//            if (cnt>5){
//                cnt = 0;
//                c1.clearOomList();
//            }
        }
    }
}

