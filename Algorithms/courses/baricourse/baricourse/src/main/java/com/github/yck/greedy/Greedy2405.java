package com.github.yck.greedy;

import org.junit.Assert;
import org.junit.Test;

import java.util.HashSet;
import java.util.Set;

/**
 * @author Chengkai Yang
 * @version 1.0
 * @date 2024/5/30 19:35
 * 贪心原则；
 *  1. 返回最少的字符串个数，那么截取子字符串时候，每一次截取最长的即可，非常直观
 * https://leetcode.com/problems/optimal-partition-of-string/description/
 */

class Solution2405 {
    public int partitionString(String s) {
        int count = 0;
        Set<Character> c = new HashSet<>();

        char[] charArray = s.toCharArray();
        for (int i = 0; i < charArray.length; i++) {
            if (c.contains(charArray[i])){
                count ++;
                c.clear();
            }else {
                //
            }
            c.add(charArray[i]);

        }
        if (!c.isEmpty()){
            count++;
        }
        return count;
    }
}

public class Greedy2405 {
    @Test
    public void test(){
        Solution2405 solution2405 = new Solution2405();
        Assert.assertEquals(solution2405.partitionString("abacaba"),4);
        Assert.assertEquals(solution2405.partitionString("ssssss"),6);
    }
}
