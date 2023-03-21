package com.github.yck.ds.hash;

import java.util.*;

/**
 * https://leetcode.cn/problems/longest-harmonious-subsequence/
 * 594. 最长和谐子序列
 * 简单
 * 358
 * 相关企业
 * 和谐数组是指一个数组里元素的最大值和最小值之间的差别 正好是 1 。
 *
 * 现在，给你一个整数数组 nums ，请你在所有可能的子序列中找到最长的和谐子序列的长度。
 *
 * 数组的子序列是一个由数组派生出来的序列，它可以通过删除一些元素或不删除元素、且不改变其余元素的顺序而得到。
 *
 *输入：nums = [1,3,2,2,5,2,3,7]
 * 输出：5
 * 解释：最长的和谐子序列是 [3,2,2,2,3]
 */
public class LongestHarmoniousSubsequence_594 {
    /**
     *
     * 和谐子序列有 切只有2个元素，求出两个元素覆盖的最长元素即可。
     * 1. 统计所有元素第一次出现和最后一次出现的下标 map
     * 2. 顺序遍历map，计算之间的差额
     * @param nums
     * @return
     */
    public int findLHS(int[] nums) {
        // Key为有序的Map
        // 统计每个key
       Map<Integer,Integer> m = new HashMap<>();
       for (int i = 0; i < nums.length; i++) {
            m.put(nums[i],m.getOrDefault(nums[i],0)+ 1);
       }
       Integer max = 0;
        for (Integer key : m.keySet()) {
            if (m.containsKey(key+1)){
                max = Math.max(max,m.get(key)+m.get(key+1));
//                m.get(key)+m.get(key+1)
            }
        }
        return max;
    }


    public static void main(String[] args) {
        LongestHarmoniousSubsequence_594 t = new LongestHarmoniousSubsequence_594();
        System.out.println(t.findLHS(new int[]{1, 3, 2, 2, 5, 2, 3, 7}));
        System.out.println(t.findLHS(new int[]{1, 2,3,4}));
        System.out.println(t.findLHS(new int[]{1, 1,1,1}));
    }
}
