package com.github.yck.heap.iterativeUsingHeap;

import org.junit.Assert;
import org.junit.Test;

import java.util.*;

/**
 * https://leetcode.com/problems/find-subsequence-of-length-k-with-the-largest-sum/description/
 * @author Chengkai Yang
 * @version 1.0
 * @date 2024/2/11 19:39
 */
class Solution2099Bean implements Comparable<Solution2099Bean>{
    public Integer priority;
    public Integer idx;

    public Integer getPriority() {
        return priority;
    }

    public void setPriority(Integer priority) {
        this.priority = priority;
    }

    public Integer getIdx() {
        return idx;
    }

    public void setIdx(Integer idx) {
        this.idx = idx;
    }

    public Solution2099Bean(Integer priority, Integer idx) {
        this.priority = priority;
        this.idx = idx;
    }

    @Override
    public int compareTo(Solution2099Bean o) {
        return Integer.compare(this.priority,o.priority);
    }
}


class Solution2099 {
    /**
     * 这道题就是背景稍微有些绕
     * 不打乱顺序下，可以跳着找长度为k的子字符串，要求和最大。
     * 其实就是求 topN
     * @param nums
     * @param k
     * @return
     */
    public int[] maxSubsequence(int[] nums, int k) {
        int[] re = new int[k];
        PriorityQueue<Solution2099Bean> maxHeap = new PriorityQueue<>();
        for (int i = 0; i < nums.length; i++) {

            maxHeap.offer(new Solution2099Bean(nums[i],i));
            if (maxHeap.size()>k){
                maxHeap.poll();
            }
        }

        TreeMap<Integer,Integer> reT = new TreeMap<>();
        while (maxHeap.size()>0){
            Solution2099Bean bean = maxHeap.poll();
            reT.put(bean.getIdx(),bean.getPriority());
        }
        int idx = 0;
        for (Integer value : reT.values()) {
            re[idx] = value;
            idx++;
        }
        return re;
    }
}
public class FindSubsequenceofLengthKWiththeLargestSum {
    @Test
    public void test(){
        Solution2099 s = new Solution2099();
        Assert.assertArrayEquals(s.maxSubsequence(new int []{-1,-2,3,4},3),new int[]{-1,3,4});
        Assert.assertArrayEquals(s.maxSubsequence(new int []{50,-75},2),new int[]{50,-75});
    }

}
