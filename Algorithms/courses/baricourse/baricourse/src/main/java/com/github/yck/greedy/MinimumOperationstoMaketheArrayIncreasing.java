package com.github.yck.greedy;

/**
 * @author Chengkai Yang
 * @version 1.0
 * @date 2024/3/7 20:25
 */

class Solution1827 {
    /**
     * https://leetcode.com/problems/minimum-operations-to-make-the-array-increasing/description/
     * 贪心的做法无非是保证按照最小数量严格递增
     * @param nums
     * @return
     */
    public int minOperations(int[] nums) {
        if(nums.length == 1){
            return 0;
        }
        int c = 0;
        int lastNum = nums[0];
        for (int i = 1; i < nums.length; i++) {
            if (lastNum < nums[i]){
                // Do nothing
            }else {
                c = c + (lastNum - nums[i]) + 1;
                nums[i] = lastNum + 1;
            }
            lastNum = nums[i];
        }
        return c;
    }
}
public class MinimumOperationstoMaketheArrayIncreasing {
}
