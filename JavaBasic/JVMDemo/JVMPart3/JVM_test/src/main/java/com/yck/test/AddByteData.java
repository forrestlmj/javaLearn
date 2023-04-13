package com.yck.test;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * 本程序功能为不断的向 JVM 中添加 byte[] 数组，便于使用命令行
 * 来观测堆信息
 *
 * 设置 SurvivorRatio 时候注意关闭 -UseAdaptiveSizePolicy
 * 这样保证 8Mb = 8Mb老年区（2MB伊甸园 2MB幸运者(1MB+1MB)）
 * -Xmx8m -Xms8m -XX:SurvivorRatio=1 -XX:NewRatio=1 -XX:-UseAdaptiveSizePolicy
 */
public class AddByteData {
    private static final int KB = 1024;
    private static final int sizeKB = 128;
    public static void main(String[] args) throws InterruptedException {
        List<byte[]> data = new ArrayList<>();
        while (true){
            // ArrayList 达到 128*KB * 8 <= 1024KB 时候放弃。
            for (int i = 0; i < 8; i++) {
                data.add(new byte[sizeKB * KB]);
                Thread.sleep(1000);
                System.out.println("已经添加 ");
            }
            System.out.println("申请新数据");
            data = new ArrayList<>();
        }
    }
}
