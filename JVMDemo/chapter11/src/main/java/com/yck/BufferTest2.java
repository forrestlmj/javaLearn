package com.yck;

import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.List;

/**
 * -XX:MaxDirectMemorySize=10g  -XX:+PrintFlagsInitial
 * 会报错如下：
 * Exception in thread "main" java.lang.OutOfMemoryError: Direct buffer memory
 * 	at java.nio.Bits.reserveMemory(Bits.java:695)
 * 	at java.nio.DirectByteBuffer.<init>(DirectByteBuffer.java:123)
 * 	at java.nio.ByteBuffer.allocateDirect(ByteBuffer.java:311)
 * 	at com.yck.BufferTest2.main(BufferTest2.java:14)
 * 10240MB
 */
public class BufferTest2 {
    private static final int BUFFER = 1024 * 1024 * 20;
    public static void main(String[] args) {
        List<ByteBuffer> a = new ArrayList<>();
        int count = 0 ;
        try {
            while (true){
                a.add(ByteBuffer.allocateDirect(BUFFER));
                try {
                    Thread.sleep(100);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                count ++;
            }
        }finally {
            System.out.println(count*20+"MB");

        }

    }
}
