package com.github.yck.heap.editArrayEveryRoundUsingHeap;

import java.util.Comparator;
import java.util.PriorityQueue;

/**
 * https://leetcode.com/problems/last-stone-weight/
 * @author Chengkai Yang
 * @version 1.0
 * @date 2024/2/11 16:50
 */

class Solution1046 {
    public int lastStoneWeight(int[] stones) {
        PriorityQueue<Integer> maxHeap = new PriorityQueue<>(stones.length, Comparator.reverseOrder());
        for (int stone : stones) {
            maxHeap.offer(stone);
        }

        while (maxHeap.size()>1){
            Integer a = maxHeap.poll();
            Integer b = maxHeap.poll();
            if(!a.equals(b)){
                maxHeap.offer(Math.abs(a-b));
            }
        }
        if (maxHeap.size() == 1){
            return maxHeap.poll();
        }else {
            return 0;
        }
    }
}
public class LastStoneWeight {

}
