package com.yck;

import java.nio.ByteBuffer;
import java.util.Scanner;

/**
 * IO               NIO (New IO / Non-Blocking IO)
 * byte[] / char[]  Buffer
 * Stream           Channel
 */
public class BufferTest {
    // 1GB空间
    private static final int BUFFER = 1024 * 1024 * 1024;
    public static void main(String[] args) {
        //直接分配本地内存
        ByteBuffer byteBuffer = ByteBuffer.allocateDirect(BUFFER);
        System.out.println("内存分配完成");
        Scanner scanner = new Scanner(System.in);
        scanner.next();
        System.out.println("直接内存释放");
        byteBuffer = null;
        System.gc();
        scanner.next();
    }

}
