package com.github.yck.greedy;

/**
 * @author Chengkai Yang
 * @version 1.0
 * @date 2024/3/3 21:12
 */
class Solution {
    /**
     * https://leetcode.com/problems/maximum-sum-with-exactly-k-elements/
     * 第一次返回最大的值，每次就能返回最大值
     * @param nums
     * @param k
     * @return
     */
    public int maximizeSum(int[] nums, int k) {
        int maxValue = -1;
        for (int num : nums) {
            if (num>maxValue){
                maxValue = num;
            }
        }
        return maxValue*k + (k)*(k-1)/2;
    }
}
public class MaximumSumWithExactlyKElements {
}
