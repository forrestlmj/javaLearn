package com.github.yck;

import cn.hutool.core.lang.Assert;

import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
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
            add(new Solution2089Traversal());
            add(new Solution2089SortAndBinarySearch());
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

/**
 * Time Complexity: O(N)
 * Space Complexity: O(N)
 */
class Solution2089Traversal implements Solution2089{
    @Override
    public List<Integer> targetIndices(int[] nums, int target) {
        int startIndex = -1;
        int cnt = 0;
        List<Integer> result = new ArrayList<>();
        for (int i = 0; i < nums.length; i++) {
            if(nums[i] == target){
                if(cnt == 0){
                    startIndex ++;
                }
                cnt ++;

            } else if (nums[i] < target) {
                startIndex = startIndex + 1;

            }else {

            }
        }
        for (int i = startIndex; i < startIndex+cnt; i++) {
            result.add(i);
        }
        return result;
    }
}

/**
 * Time Complexity: O(NlogN) + O(LogN)
 */
class Solution2089SortAndBinarySearch implements Solution2089{
    @Override
    public List<Integer> targetIndices(int[] nums, int target) {
        Arrays.sort(nums);
//        System.out.println(nums);
        int low = 0;
        int high = nums.length - 1;
        List<Integer> re = new ArrayList<>();
        int leftIndex = Integer.MAX_VALUE;
        int rightIndex = Integer.MIN_VALUE;
        // Binary Search for the leftIndex
        while (low <= high){
            int mid = low + (high - low) / 2;
            if(target == nums[mid]){
                if(mid > 0){
                    if( target > nums[mid-1]) {
                        leftIndex = mid;
                        break;
                    }else {
                        high = mid -1;
                    }
                }else {
                    leftIndex = 0;
                    break;
                }

            } else if (target < nums[mid]) {
                high = mid - 1;
            }else{
                low = mid + 1;
            }
        }
        // Binary Search for the rightIndex
        low = 0;
        high = nums.length - 1;
        while (low <= high){
            int mid = low + (high - low) / 2;
            if(target == nums[mid]){
                if(mid < nums.length-1){
                    if( target < nums[mid+1]) {
                        rightIndex = mid;
                        break;
                    }else {
                        low = mid + 1;
                    }
                }else {
                    rightIndex = nums.length - 1;
                    break;
                }

            } else if (target < nums[mid]) {
                high = mid - 1;
            }else{
                low = mid + 1;
            }
        }
        for (int i = leftIndex; i <= rightIndex; i++) {
            re.add(i);
        }
        return re;
    }
}