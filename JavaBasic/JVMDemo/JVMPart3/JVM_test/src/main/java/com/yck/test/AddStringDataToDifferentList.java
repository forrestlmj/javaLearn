package com.yck.test;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;
//-Xmx1m -Xms1m -XX:SurvivorRatio=1 -XX:NewRatio=1 -XX:-UseAdaptiveSizePolicy -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=E://JVM//MAT//com.yck.test.AddStringDataToDifferentList.hprof
/**
 * 可以加调试参数：
 * -XX:+HeapDumpBeforeFullGC
 * FullGC 之前heap dump
 *
 * {@link com.yck.mat.TestMat}
 * 这里演示一下 浅堆、深堆、对象大小的区别，以及在 MAT 中，如何查看这些数据
 *
 * 模拟方式：
 * 1.申请员工、经理、老板三种不同的列表。
 * 2.观测同一对象的浅堆、深堆（只被一个对象引用）、对象大小。
 *
 *
 * 程序运行结果：
 * - 浅堆没什么可说，都是24
 * - 对象大小：
 *  employee 6789
 *  manager 32
 *  boss 10
 * - 深堆
 *  - 31个字符串 单独列出 = boss + manager
 *  - employee: 6757 个字符串 ，可直接被回收
 *  - manager:0
 *  - boss:0
 */
public class AddStringDataToDifferentList {
    public static void main(String[] args) throws InterruptedException {
        AddStringDataToDifferentList ad = new AddStringDataToDifferentList();
        ad.test();
    }
    public void test() throws InterruptedException {
        List<String> employee = new ArrayList<>();
        List<String> manager = new ArrayList<>();
        List<String> boss = new ArrayList<>();
        List<byte[]> d =new ArrayList<>();

        for (int i = 0; i < 10000; i++) {
                String name = "Hello,My id is ID_"+i+". This is my first day";
                employee.add(name);
                if (i < 9 ) manager.add(name);
                if( i < 31 ) boss.add(name);
        }



//        employee.clear();
//        manager.clear();
//        boss.clear();
//        while (true){{
//            TimeUnit.SECONDS.sleep(1);
//            d.add(new byte[2 * 1024 * 1024]);
//        }}
//        System.gc();

    }
}

