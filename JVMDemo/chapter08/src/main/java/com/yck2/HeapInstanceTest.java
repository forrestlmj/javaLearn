package com.yck2;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 * 通过这个例子 观测新生代中伊甸园、幸存者区、老年代的存活规律
 * 每1000ms，生成一个 512 kb的内存，
 * 总的内存空间为30mb，其中老年代20mb，新生代10mb，伊甸园区8mb，一点园区
 * -Xms30m
 * -Xmx30m
 * -XX:+PrintGCDetails
 */
public class HeapInstanceTest {
    byte[] buffer = new byte[1024 * 256];

    public static void main(String[] args) {
        ArrayList<HeapInstanceTest> list = new ArrayList<HeapInstanceTest>();
        while (true) {
            list.add(new HeapInstanceTest());
            try {
                Thread.sleep(300);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}
