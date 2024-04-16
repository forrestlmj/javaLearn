package com.github.yck.greedy;

import org.junit.Test;

/**
 * @author Chengkai Yang
 * @version 1.0
 * @date 2024/4/9 19:40
 * https://leetcode.com/problems/partitioning-into-minimum-number-of-deci-binary-numbers/
 */
class Solution1689 {
    public int minPartitions(String n) {
        String[] split = n.split("");
        int max = 0;

        for (int i = 0; i < split.length; i++) {
            if(Integer.valueOf(split[i]) > max){
                max = Integer.valueOf( split[i]);
            }
        }
        return max;
    }
}
public class PartitioningIntoMinimumNumberOfDeciBinaryNumbers {
    @Test
    public void test(){
        Solution1689 s = new Solution1689();
        System.out.println(s.minPartitions("32"));
    }
}
