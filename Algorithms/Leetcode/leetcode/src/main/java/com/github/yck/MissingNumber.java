package com.github.yck;
import cn.hutool.core.lang.Assert;

/**
 * @author Chengkai Yang
 * @version 1.0
 * @date 2023/11/10 10:06
 * <a href="https://leetcode.com/problems/missing-number/submissions/1095627742/"> 268. Missing Number </a>
 */
public class MissingNumber {
    public static void main(String[] args) {
        MissingNumberSolution m = new MissingNumberSolution();
        Assert.equals(m.missingNumber(new int[]{3, 0, 1}),2);
        Assert.equals(m.missingNumber(new int[]{0, 1}),2);
        Assert.equals(m.missingNumber(new int[]{9, 6, 4, 2, 3, 5, 7, 0, 1}),8);
    }
}
class MissingNumberSolution{
    public int missingNumber(int[] nums) {
        int sum = nums.length * (nums.length + 1)/2;
        int total = 0;
        for (int i = 0; i < nums.length; i++) {
            total += nums[i];
        }
        return sum - total;
    }
}