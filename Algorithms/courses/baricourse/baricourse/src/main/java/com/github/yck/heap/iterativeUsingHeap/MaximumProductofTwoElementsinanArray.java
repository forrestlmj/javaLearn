package com.github.yck.heap.iterativeUsingHeap;

import org.junit.Test;

import java.util.PriorityQueue;

/**
 * https://leetcode.com/problems/maximum-product-of-two-elements-in-an-array/
 * @author Chengkai Yang
 * @version 1.0
 * @date 2024/2/8 23:53
 */
class Solution1464 {
    /**
     * 水题，找 top2
     * @param nums
     * @return
     */
    public int maxProduct(int[] nums) {
        PriorityQueue<Integer> min = new PriorityQueue<>(2);
        for (int num : nums) {
            min.offer(num);
            if (min.size()>2){
                min.poll();
            }
        }
        Integer a = min.poll() -1;
        Integer b =min.poll()-1;
        return a*b;
    }
}
public class MaximumProductofTwoElementsinanArray {
    @Test
    public void test(){

    }
}
