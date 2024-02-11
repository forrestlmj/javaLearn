package com.github.yck.heap.editArrayEveryRoundUsingHeap;

import org.junit.Test;

import java.util.Comparator;
import java.util.PriorityQueue;

/**
 *
 * https://leetcode.com/problems/minimum-amount-of-time-to-fill-cups/
 * @author Chengkai Yang
 * @version 1.0
 * @date 2024/2/11 17:49
 */

class Solution2335 {
    /**
     * 这道题比较简单。
     * 业务背景需要先清楚，再抽象为代码层级。
     *TODO 有意思
     * 这里的背景算法是要每次倒水的时候：
     * 1. 尽量保证全过程都倒两杯，最后一杯留到最后慢慢倒。
     * 2. 那就是每轮哪2杯多，倒哪两杯。
     * 这样
     * @param amount
     * @return
     */
    public int fillCups(int[] amount) {
        PriorityQueue<Integer> maxHeap = new PriorityQueue<>(3, Comparator.reverseOrder());
        for (int i : amount) {
            if (i>0){
                maxHeap.offer(i);
            }
        }
        int re = 0;
        while (maxHeap.size()>1){
            Integer poll = maxHeap.poll();
            Integer poll1 = maxHeap.poll();
            // 如果第二杯空杯了，说明只剩下一杯了
            if (poll1==0){
                // 第一杯倒回去
                maxHeap.poll();
                maxHeap.offer(poll);
                break;
            }
            re ++;
            poll1--;
            poll--;
            maxHeap.offer(poll);
            maxHeap.offer(poll1);


        }
        if (maxHeap.size() == 1){
            re = re + maxHeap.poll();

        }
        return re;
    }
}
public class MinimumAmountofTimetoFillCups {
    @Test
    public void test(){
        Solution2335 s = new Solution2335();
        s.fillCups(new int[]{1,4,2});
    }
}
