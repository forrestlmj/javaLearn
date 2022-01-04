package com.yck2;

import java.util.ArrayList;
import java.util.List;

/**
 * 通过这个例子 观测新生代中伊甸园、幸存者区、老年代的存活规律
 * 每1000ms，生成一个 512 kb的内存，
 * 总的内存空间为30mb，其中老年代20mb，新生代10mb，伊甸园区8mb，一点园区
 * -Xms30m
 * -Xmx30m
 */
public class HeapInstanceTest {
    public static void main(String[] args) throws InterruptedException {
        List<Object> t = new ArrayList<>();
        while (true){
            byte[] buff = new byte[1024*512];

            Thread.sleep(1000);
            t.add(buff);

        }
    }
}
