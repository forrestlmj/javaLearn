package com.github.yck.heap;

import org.junit.Assert;
import org.junit.Test;

import java.util.*;

/**
 *
 * https://leetcode.com/problems/minimum-number-game/description/
 * @author Chengkai Yang
 * @version 1.0
 * @date 2024/2/8 22:43
 */

interface Solution2974{
     int[] numberGame(int[] nums) ;
}
class UsingHeapSolvingSolution2974 implements Solution2974{

    /**
     * 解法比较明显，就是使用堆，遍历数组，求topN，这里就两个人，其实就是 Top 2
     * 然后遍历一次，就将结果写一次。
     * 时间复杂度
     *
     * 这里的核心难点其实是：
     * 一般的优先队列只存储优先级，通过优先级来进行堆的插入和删除。
     * 但是如何存储插入和删除信息的其他信息呢？
     * 1. 方案1，实现 class，包装类，实现 compare 接口，放到堆里面。
     * 2. 方案2，将要包装的类所有信息作为索引，放入hash表中。每次 poll 出来的信息，从 hash 表里面找
     * @param nums
     * @return
     */
    @Override
    public int[] numberGame(int[] nums) {
        // 存储每一轮移除的棋子的坐标，以及值。key 为 值，value 为坐标
        Map<Integer, List<Integer>> cache =  new HashMap<>();
        int[] re = new int[nums.length];
        PriorityQueue<Integer> minHeap = new PriorityQueue<>(2,Comparator.reverseOrder());
        // 需要 loopTime 次遍历
        Integer loopTime = nums.length/2;
        int re_idx = 0;
        while (loopTime>0){
            // 找到数组中当前的最小值，以及它的坐标
            for (int i = 0; i < nums.length; i++) {
                if(nums[i] != -1){
                    minHeap.offer(nums[i]);
                    cache.putIfAbsent(nums[i],new ArrayList<>());
                    cache.get(nums[i]).add(i);
                    if (minHeap.size()>2){
                        Integer poll = minHeap.poll();
                        if (cache.get(poll).size()>1){
                            cache.get(poll).remove(cache.size()-1);
                        }else {
                            cache.remove(poll);
                        }
                    }
                }
            }
            System.out.println(cache);
            Integer bob = minHeap.poll();
            Integer alice = minHeap.poll();
            re[re_idx] = bob;
            re_idx++;
            re[re_idx] = alice;
            re_idx ++;
            for (Integer idx : cache.get(bob)) {
                nums[idx] = -1;
            }
            for (Integer idx : cache.get(alice)) {
                nums[idx] = -1;
            }
            cache.clear();
            loopTime--;
        }
        return re;
    }
}
public class MinimumNumberGame {
    /**
     * Input: nums = [5,4,2,3]
     * Output: [3,2,5,4]
     *
     * Input: nums = [2,5]
     * Output: [5,2]
     */
    @Test
    public void test(){
        Solution2974 solution2974 = new UsingHeapSolvingSolution2974();
        Assert.assertArrayEquals(solution2974.numberGame(new int[]{5,4,3,2}), new int[]{3, 2,5,4});
        Assert.assertArrayEquals(solution2974.numberGame(new int[]{2,5}), new int[]{5,2});
    }
}
