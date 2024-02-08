package com.github.yck.heap;

import java.util.Comparator;
import java.util.HashMap;
import java.util.Map;
import java.util.PriorityQueue;

/**
 * @author Chengkai Yang
 * @version 1.0
 * @date 2024/2/9 00:15
 */
class Solution2500{
    public int[] getMax(int[] a){
        int max = -1;
        int idx = -1;
        for (int i = 0; i < a.length; i++) {
            if (a[i] != -1 && a[i] > max){
                max = a[i];
                idx = i;
            }
        }
        int[] re = {max,idx};
        return re;
    }
    public int deleteGreatestValue(int[][] grid) {
        PriorityQueue<Integer> maxHeap = new PriorityQueue<>(Comparator.reverseOrder());
        Integer re = 0;
        Integer n = grid[0].length;
        while (n>0){
            for (int i = 0; i < grid.length; i++) {
                int[] max = getMax(grid[i]);
                grid[i][max[1]] = -1;
                maxHeap.offer(max[0]);
            }
            n --;
            re += maxHeap.peek();
            maxHeap.clear();
        }

        return re;
    }
}
public class DeleteGreatestValueinEachRow {
}
