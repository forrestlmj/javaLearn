package com.yck;

/**
 * 测试设置方法区大小的启动命令：
 * jdk7
 *-XX:PermSize=20m -XX:MaxPermSize=100m
 * jdk8
 * -XX:MetaspaceSize=100m  -XX:MaxMetaspaceSize=100m
 *
 */
public class MethodAreaDemo {
    public static void main(String[] args) throws InterruptedException {
        System.out.println("start");
        Thread.sleep(1000000);
        System.out.println("end");
    }
}
