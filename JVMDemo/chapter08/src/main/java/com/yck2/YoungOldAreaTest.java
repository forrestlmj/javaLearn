package com.yck2;

import java.util.ArrayList;
import java.util.List;

/** 测试：大对象直接进入老年代
 -Xms600m -Xmx600m -XX:NewRatio=20 -XX:SurvivorRatio=8 -XX:+PrintGCDetails
 * @author shkstart  shkstart@126.com
 * @create 2020  21:48
 */
public class YoungOldAreaTest {
    public static void main(String[] args) throws InterruptedException {
        List<Object> l = new ArrayList<>();
        while (true){
            byte[] buffer = new byte[1024 * 1024 * 50];//20m

            Thread.sleep(3000);
            l.add(buffer);
        }

    }
}
