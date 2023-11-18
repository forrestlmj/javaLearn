package com.github.yck;

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
             add(new Solution1608BinarySearch());
//            add(new Solution1608Recurse());
//            add(new Solution1608BruteMethod());
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
 * TODO Wrong answer. we should binary search X to find the number.
 */
class Solution1608Recurse implements Solution1608{
    private int[] binary(int[] nums, int low,int high){
        if(high ==  low + 1){
            if(
                    (nums[low] == 0 && nums[high] >= 1) ||
                    nums[high] == 0 && nums[low] >= 1){
                return new int[] {1,Math.max(nums[high],nums[low])};
            }
            // 2
            if(nums[low] >= 2 && nums[low] >= 2){
                return new int[] {2, Math.min(nums[high],nums[low])};
            }
            return new int[]{0,-1};
        } else if (high == low) {
            int re= nums[low] > 0?1:0;
            return new int[]{1,nums[low]};
        } else {
            int mid = low + (high - low)/2;
            int[] p1 = binary(nums, 0, mid);
            int[] p2 = binary(nums,mid+1,high);
            // TODO return the min value of the array and the number of X, calculate the value of
            // min value and X when combining the two answer.
            if (p1[1] >=p1[0] +p2[0] && p2[1] >= p1[0] + p2[0] ){
                return new int[]{p1[0] + p2[0],Math.min(p1[1],p2[1])} ;
            }else {
                return new int[]{0,-1};
            }

        }
    }

    @Override
    public int specialArray(int[] nums) {
        int[] re = binary(nums, 0, nums.length - 1);
        return re[0]>0?re[0]:-1;
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
class Solution1608BinarySearch implements Solution1608{


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