package com.yck.test;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.concurrent.TimeUnit;

//enum RUN_MODE{
//    /**
//     * 运行模式：一直运行
//     */
//    WHILE_TRUE,
//    /**
//     * 运行模式：运行10秒结束
//     */
//    UNTIL,
//}
/**
 *
 * 本程序功能为不断的向 JVM 中添加 字符串，便于使用命令行
 * 来观测堆信息
 *
 * 设置 SurvivorRatio 时候注意关闭 -UseAdaptiveSizePolicy
 * 这样保证 8Mb = 8Mb老年区（2MB伊甸园 2MB幸运者(1MB+1MB)）
 * -Xmx8m -Xms8m -XX:SurvivorRatio=1 -XX:NewRatio=1 -XX:-UseAdaptiveSizePolicy -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=E://JVM//com.yck.test.AddByteData.hprof
 */
public class AddStringData {

    public static void main(String[] args) throws InterruptedException {
        // 演示一下因为内存泄露而导致OOM
//        MemoryLick memoryLick = new MemoryLick();
//        memoryLick.runWillThisWillOOM();
        WillNotMemoryLick willNotMemoryLick = new WillNotMemoryLick();
        willNotMemoryLick.run();
    }
}
class Base{
    private static Random r = new Random();
    private static final String WEB_PREFIX = "http://www.facebook.com/people/home/";
    private static final String DICT = "/ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuv";

    /**
     *
     * @return 随机 生成一个128KB的字符串
     * 128KB =  128 * 1024B = 128 * 1024 char
     */
    protected String generateRandom128KBString(){
        StringBuilder sb = new StringBuilder();
        // 链接域名
        sb.append(WEB_PREFIX);
        // 随机生成一个 差 128 字节就是 128KB的链接地址
        for (int i = 0; i < 128; i++) {
            for (int j = 0; j < 1023; j++) {
                sb.append(DICT.charAt(r.nextInt(DICT.length())));
            }
        }
        String s = sb.toString();
        return s;
    }

}

/**
 * 演示一个内存泄露的例子:
 * 1. 内存泄露的原因是:
 * 调用方将自己的本地变量传递给其他方法,
 * 指望其他方法在内部将此变量设置为null,将其变为垃圾.
 *
 *
 * 2. 验证方法:
 * 按照 {@link AddStringData} 上的注释,来设置程序的JVM启动参数.
 * 这个程序会在成功申请 18 个链接 (18 * 128KB = 2.25MB)数据后挂掉.
 * 打开相应的 com.yck.AddByteData.hprof 文件,点击大对象,可以发现内存中有 18 个String
 * (TODO retained大小为 260KB,而不是128KB,不知道为什么).
 * 运行
 *
 *
 *@see MemoryLick#runWillThisWillOOM() 具体实现见此方法.
 */
@Deprecated
class MemoryLick extends Base{
    @Deprecated
    protected void allocateMemoryByListWillOOM(List<String> myString) throws InterruptedException {
        // ArrayList 达到 128*KB * 8 <= 1024KB 时候放弃。
        System.out.println("开始申请新数据");
        for (int i = 0; i < 8; i++) {
            String s = generateRandom128KBString();
            myString.add(s);
            Thread.sleep(1000);
            System.out.println("已经添加"+(i+1)+"个 128KB的网络链接 "+s.substring(0,128));
        }
        System.out.println("申请数据完成");
        // 注册新地址，让之前的字符数组被回收 !!但是没有用,方法外传过来的参数一直申请.
        myString = new ArrayList<>();
        System.out.println("已标记数据为无用");

    }

    /** !!!仔细看,运行这个方法会导致OOM!!!
     * 因为它把自己的本地变量 myString 传给 {@link #allocateMemoryByListWillOOM(List)}.
     * 虽然 {@link #allocateMemoryByListWillOOM(List)} 内部会尝试回收该变量,但没有用的.
     * 回到这个方法会还是会一直 while 循环无法回收
     * @see MemoryLick#runWillThisWillOOM(Integer untilSeconds)
     * @throws InterruptedException
     */
    @Deprecated()
    protected void runWillThisWillOOM() throws InterruptedException {
        List<String> myString = new ArrayList<>();
        while (true){
            allocateMemoryByListWillOOM(myString);
        }
    }

    /**
     * @see MemoryLick#runWillThisWillOOM()
     * @param untilSeconds
     * @throws InterruptedException
     */
    @Deprecated
    protected void runWillThisWillOOM(Integer untilSeconds) throws InterruptedException {
        List<String> myString = new ArrayList<>();
        long start = System.currentTimeMillis();
        while (true){
            allocateMemoryByListWillOOM(myString);
            long end = System.currentTimeMillis();
            if (end - start >= TimeUnit.SECONDS.toMillis(untilSeconds)) break;
        }

    }
}

/**
 * 正常运行版本,没有内存泄露
 * @see MemoryLick 内存泄露导致 OOM 版本
 */
class WillNotMemoryLick extends Base{
    /**
     * @param myString
     * @throws InterruptedException
     * @see MemoryLick#allocateMemoryByListWillOOM(List)
     */
    private void allocateMemory(List<String> myString) throws InterruptedException {
        // ArrayList 达到 128*KB * 8 <= 1024KB 时候放弃。
        System.out.println("开始申请新数据");
        for (int i = 0; i < 8; i++) {
            String s = generateRandom128KBString();
            myString.add(s);
            Thread.sleep(1000);
            System.out.println("已经添加"+(i+1)+"个 128KB的网络链接 "+s.substring(0,128));
        }
        System.out.println("申请数据完成");
    }

    /**
     *
     * @see MemoryLick#runWillThisWillOOM(Integer untilSeconds) 泄露版本
     * @throws InterruptedException
     */
    protected void run() throws InterruptedException {
        List<String> myString;
        while (true){
            myString = new ArrayList<>();
            allocateMemory(myString);
            myString = null;
            System.out.println("已标记数据为无用");
        }
    }


    protected void run(Integer untilSeconds) throws InterruptedException {
        List<String> myString ;
        long start = System.currentTimeMillis();
        while (true){
            myString = new ArrayList<>();
            allocateMemory(myString);
            myString = null;
            System.out.println("已标记数据为无用");
            long end = System.currentTimeMillis();
            if (end - start >= TimeUnit.SECONDS.toMillis(untilSeconds)) break;
        }

    }
}

