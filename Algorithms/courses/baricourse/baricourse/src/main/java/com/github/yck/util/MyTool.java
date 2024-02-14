package com.github.yck.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 * @author Chengkai Yang
 * @version 1.0
 * @date 2024/2/13 21:27
 */
public class MyTool {
    public static List<Integer> generateRandomList(int length,int bound){
        List<Integer> re = new ArrayList<>(length);
        Random r = new Random();
        for (int i = 0; i < length; i++) {
            re.add(r.nextInt(bound));
        }
        return re;
    }
}
