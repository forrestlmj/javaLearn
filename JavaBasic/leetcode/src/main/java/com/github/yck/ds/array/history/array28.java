package com.github.yck.ds.array.history;
//https://leetcode-cn.com/explore/interview/card/top-interview-questions-easy/1/array/28/
public class array28 {
    /*
    双指针
     */
    public void moveZeroes(int[] nums) {
        int slow = 0;
        for(int i = 0;i<nums.length;i++){
            if(nums[i]!=0){
                nums[slow] = nums[i];
                slow++;
            }
        }
        for(int i = slow;i<nums.length;i++){
            nums[i] = 0;
        }

    }
}
