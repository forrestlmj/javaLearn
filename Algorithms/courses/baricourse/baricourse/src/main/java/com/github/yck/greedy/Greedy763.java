package com.github.yck.greedy;

import cn.hutool.core.lang.Assert;
import org.junit.Test;

import java.util.*;
import java.util.stream.Collectors;

/**
 * @author Chengkai Yang
 * @version 1.0
 * @date 2024/5/30 19:59
 * https://leetcode.com/problems/partition-labels/description/
 * 比较好的题目
 * 贪心原则：
 * 1. 第一次遍历字符串，首先计算出每个字母出现的最后位置。
 * 2. 第二次遍历字符串，为了决定如何分区，分区的贪心原则是，当前遍历的字母的最后位置与当前分区的最后位置做比较，取最大的。如果遍历到的索引为当前的分区结束位置，则断开。
 */


class Solution764 {

    public List<Integer> partitionLabels(String s) {
        List<Integer> result = new ArrayList<>();
        Map<Character,Integer> m = new HashMap<>();
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            m.put(c,i);
        }
        int end = -1;
        int partitionLen = 0;
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            Integer lastIndexOfC = m.get(c);
            end = Math.max(end,lastIndexOfC);
            partitionLen ++;
            if (i == end){

                result.add(partitionLen);
                partitionLen = 0;
            }
        }
        return result;
    }
}
public class Greedy763 {
    @Test
    public void test(){

        Solution764 s = new Solution764();
        // ababcbaca  defegde hijhklij
        String i = "ababcbacadefegdehijhklij";
        System.out.println(i.substring(0,9));
        System.out.println(i.substring(9,16));
        System.out.println(i.substring(16,24));
//        s.partitionLabels("caedbdedda");
//        s.partitionLabels("caedbdedda");
        Assert.equals(s.partitionLabels("ababcbacadefegdehijhklij"), Arrays.asList(9,7,8));
        Assert.equals(s.partitionLabels("caedbdedda"), Arrays.asList(1,9));
        Assert.equals(s.partitionLabels("eaaaabaaec"), Arrays.asList(9,1));
        Assert.equals(s.partitionLabels("eccbbbbdec"), Arrays.asList(10));
    }
}
