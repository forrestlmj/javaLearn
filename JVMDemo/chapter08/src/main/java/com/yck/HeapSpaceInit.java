package com.yck;

/**
 * -Xms20m -Xmx20m -XX:+PrintGCDetails
 * Heap
 *  PSYoungGen      total 6144K, used 1841K [0x00000000ff980000, 0x0000000100000000, 0x0000000100000000)
 *   eden space 5632K, 32% used [0x00000000ff980000,0x00000000ffb4c508,0x00000000fff00000)
 *   from space 512K, 0% used [0x00000000fff80000,0x00000000fff80000,0x0000000100000000)
 *   to   space 512K, 0% used [0x00000000fff00000,0x00000000fff00000,0x00000000fff80000)
 *  ParOldGen       total 13824K, used 0K [0x00000000fec00000, 0x00000000ff980000, 0x00000000ff980000)
 *   object space 13824K, 0% used [0x00000000fec00000,0x00000000fec00000,0x00000000ff980000)
 *  Metaspace       used 3204K, capacity 4496K, committed 4864K, reserved 1056768K
 *   class space    used 349K, capacity 388K, committed 512K, reserved 1048576K
 * 这里-Xms = 20M * 1024 = 20480K = 6144K(eden 5632K + from(512K)/to(512K))PSYoungGen + 13824K ParOldGen + 512K(from/to) = 20480K
 * initMemory = 19968K = 6144K+13824K = 新生代+老生代
 */
public class HeapSpaceInit {
    public static void main(String[] args) throws InterruptedException {
        long initMemory = Runtime.getRuntime().totalMemory();
        System.out.println("初始堆大小 -Xms"+initMemory/1024);
        long maxMemory = Runtime.getRuntime().maxMemory();
        System.out.println("最大堆大小 -Xmx"+maxMemory/1024);
//        Thread.sleep(1000000);
    }
}
