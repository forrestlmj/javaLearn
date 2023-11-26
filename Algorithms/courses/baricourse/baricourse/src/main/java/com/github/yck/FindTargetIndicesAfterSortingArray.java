package com.github.yck;

import cn.hutool.core.lang.Assert;

import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Chengkai Yang
 * @version 1.0
 * @date 2023/11/26 20:35
 *
 * https://leetcode.com/problems/find-target-indices-after-sorting-array/description/
 * Input: nums = [1,2,5,2,3], target = 2
 * nums = [1,2,5,2,3], target = 3
 *  nums = [1,2,5,2,3], target = 5
Example 1:

Input: nums = [1,2,5,2,3], target = 2
Output: [1,2]
Explanation: After sorting, nums is [1,2,2,3,5].
The indices where nums[i] == 2 are 1 and 2.
Example 2:

Input: nums = [1,2,5,2,3], target = 3
Output: [3]
Explanation: After sorting, nums is [1,2,2,3,5].
The index where nums[i] == 3 is 3.
Example 3:

Input: nums = [1,2,5,2,3], target = 5
Output: [4]
Explanation: After sorting, nums is [1,2,2,3,5].
The index where nums[i] == 5 is 4.

 **/
public class FindTargetIndicesAfterSortingArray {
    public static void main(String[] args) {
        List<Solution2089> a = new ArrayList<Solution2089>(){{
            add(new SolutionNTimeComplexity());
        }};
        a.forEach(
                solution2089 ->{
                    Assert.equals(solution2089.targetIndices(new int[]{1,2,5,2,3},2),new ArrayList<Integer>(){{add(1);add(2);}});
                    Assert.equals(solution2089.targetIndices(new int[]{1,2,5,2,3},3),new ArrayList<Integer>(){{add(3);}});
                    Assert.equals(solution2089.targetIndices(new int[]{1,2,5,2,3},5),new ArrayList<Integer>(){{add(4);}});
                }
        );
    }
}
interface Solution2089{
    List<Integer> targetIndices(int[] nums, int target);
}
class SolutionNTimeComplexity implements Solution2089{
    @Override
    public List<Integer> targetIndices(int[] nums, int target) {
        int startIndex = -1;
        List<Integer> result = new ArrayList<>();
        for (int i = 0; i < nums.length; i++) {
            if(nums[i] == target){
                startIndex = startIndex + 1;
                result.add(startIndex);
            } else if (nums[i] < target) {
                startIndex = startIndex + 1;
                for (int j = 0; j < result.size(); j++) {
                    int newValue = (Integer) result.get(j) + 1;
                    result.set(j,newValue);
                }
            }else {

            }
        }
        return result;
    }
}
class Solution2089N implements Solution2089{
    private List<Integer> makeResult(int target,int[] nums){
        List<Integer> result = new ArrayList<>();
        int cnt = -1;
        for (int num : nums) {
            if (num == target){
                cnt++;
                result.add(target+cnt);
            }
        }
        return result;

    }

    @Override
    public List<Integer> targetIndices(int[] nums, int target) {
        List<Integer> result = new ArrayList<>();
        int low = 0;
        int high = nums.length-1;
        while (low <= high) {
            int mid = low + (high - low) / 2;
            int lessThanMid = NumberOfElememntLessThanMid(nums, mid);
            if(lessThanMid == mid){
                return makeResult(target,nums);
            } else if (lessThanMid < mid) {
                high = mid - 1;

            }else {
                low = mid + 1;

            }
        }
        return result;
    }

    private int NumberOfElememntLessThanMid(int[] nums, int mid) {
        int count = 0;
        for (int i = 0; i < nums.length; i++) {
            if (nums[i] < mid){
                count ++;
            }
        }
        return count;
    }
}