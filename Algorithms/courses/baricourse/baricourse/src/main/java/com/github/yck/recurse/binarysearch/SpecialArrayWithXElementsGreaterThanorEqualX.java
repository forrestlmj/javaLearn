package com.github.yck.recurse.binarysearch;

import cn.hutool.core.lang.Assert;

import java.util.*;

/**
 * @author Chengkai Yang
 * @version 1.0
 * @date 2023/11/17 14:34
 */
public class SpecialArrayWithXElementsGreaterThanorEqualX {
    public static void main(String[] args) {
         new ArrayList<Solution1608>(){{
             add(new Solution1608BinarySearchRecursively());
            add(new Solution1608BinarySearchIteratively());
            add(new Solution1608BruteMethod());
        }}.forEach(
                 solution1608 -> {
                     Assert.equals(solution1608.specialArray(new int[]{3,9,7,8,3,8,6,6}),6);//2

                    Assert.equals(solution1608.specialArray(new int[]{3, 5}),2);//2
                     Assert.equals(solution1608.specialArray(new int[] {0,0}),-1);//-1
                     Assert.equals(solution1608.specialArray(new int[] {0,2}),1);//-1
                     Assert.equals(solution1608.specialArray(new int[] {1,0}),1);//-1
                     Assert.equals(solution1608.specialArray(new int[] {1,1}),-1);//-1
                     Assert.equals(solution1608.specialArray(new int[] {5,4}),2);//-1
                     Assert.equals(solution1608.specialArray(new int[] {2,2}),2);//-1
                     Assert.equals(solution1608.specialArray(new int[] {1,2}),-1);//-1
                    Assert.equals(solution1608.specialArray(new int[] {0,4,3,0,4}),3);//3
                    Assert.equals(solution1608.specialArray(new int[] {3,6,7,7,0}),-1);//-1
                }
         );


    }
}
interface Solution1608{
    int specialArray(int[] nums);

}

/**
 * <a href="https://leetcode.com/submissions/detail/1100629446/">Accepted</a>
 * Brute method
 * 1. Sorting the array into another List.
 * 2. Traversing the List filter the element that smaller the index.
 * Time Complexity:
 * O(N*LogN)+N
 */
class Solution1608BruteMethod implements Solution1608{

    @Override
    public int specialArray(int[] nums) {
        List<Integer> tmp = new ArrayList<Integer>(nums.length);
        for (int i = 0; i < nums.length; i++) {
            tmp.add(nums[i]);
        }
        Collections.sort(tmp, new Comparator<Integer>() {
            @Override
            public int compare(Integer o1, Integer o2) {
                return o2-o1;
            }
        });
        System.out.println(tmp);
        int re = -1;
        for (int i = 0; i < tmp.size(); i++) {
            if( tmp.get(i) >= i+1){
                re = i+1;
            }else{
                break;
            }
        }
        if(re == -1){
            return -1;
        }
        if(tmp.size()>re){
            if(tmp.get(re)>=re){
                return -1;
            }
        }
        return re;
    }
}

/**
 * <a href="https://leetcode.com/problems/special-array-with-x-elements-greater-than-or-equal-x/submissions/1101448472/">Accepted</a>
 * Using Recurse solution
 */
class Solution1608BinarySearchRecursively implements Solution1608{
    /**
     * Find the number of array that greater or equal than mid.
     * @param mid the value needed to be compared.
     * @param nums the original array
     * @return
     */
    private int findElementsGreaterthanMid(int mid, int[] nums) {
        int cnt = 0;

        for(int i = 0; i < nums.length; i++){
            if(nums[i] >= mid){
                cnt ++;
            }
        }

        return cnt;
    }
    private int binary(int[] nums, int low,int high){
        // Is the problem can be solved.
        if(low == high){
            if(findElementsGreaterthanMid(low,nums) == low){
                return low;
            }else {
                return -1;
            }
        } else if (low > high) {
            return -1;
        } else{
            int mid = low + (high - low) / 2;
            int cnt = findElementsGreaterthanMid(mid, nums);
            if(mid == cnt){
                return mid;
            }else if (mid > cnt ){
                // means we should move the high index to the left of the middle index.
                high = mid - 1;
                return binary(nums,low,high);
            }else {
                low = mid + 1;
                return binary(nums,low,high);
            }
        }
        // else: divide the problem into sub problems. Apply binary search to sub problems. Combine the answers of each sub problems;
    }

    @Override
    public int specialArray(int[] nums) {
        int low = 1;
        int high = Integer.MIN_VALUE;
        for (int x:nums){
            high = Math.max(x,high);

        }
        return binary(nums, 1, high);

    }
}

/**
 * <a href="https://leetcode.com/submissions/detail/1101398489/">Accepted<a/>
 *
 * The recurrence relation is:
 * T(N) = T(N/2) + N
 * According to the master theorem, the time complexity is O(N*LogN)
 * The space complexity is O(N*LogN)
 *
 */
class Solution1608BinarySearchIteratively implements Solution1608{


    @Override
    public int specialArray(int[] nums) {
        // 1. define the low, high, mid of the binary search process.
        int low = 1;// 1 means that there is only one element greater than 1
        int high = Integer.MIN_VALUE;
        // 2. find the maximum value in the array.
        for(int x:nums){
            high = Math.max(high,x);
        }
        return binarySearchArray(nums,low,high);

    }

    /**
     * @param nums
     * @param low
     * @param high
     * @return
     */
    private int binarySearchArray(int[] nums, int low, int high) {
        // 3. apply the binary search
        while(low<=high){
            int mid = low + (high - low) /2;
            int cnt = findElementsGreaterthanMid(mid,nums);
            //
            if (cnt == mid){
                return mid;
            }
            // When mid greater than cnt, meaning that there are fewer elements greater than x, so we should searching left
            // and move the high index to the left of the mid .
            if(mid > cnt){
                // When using binary search iteratively, do not recursive call the method.
                high = mid - 1;
            }else {
                low = mid + 1;
            }
        }
        return -1;
    }

    /**
     * Find the number of array that greater or equal than mid.
     * @param mid the value needed to be compared.
     * @param nums the original array
     * @return
     */
    private int findElementsGreaterthanMid(int mid, int[] nums) {
        int cnt = 0;

        for(int i = 0; i < nums.length; i++){
            if(nums[i] >= mid){
                cnt ++;
            }
        }

        return cnt;
    }
}