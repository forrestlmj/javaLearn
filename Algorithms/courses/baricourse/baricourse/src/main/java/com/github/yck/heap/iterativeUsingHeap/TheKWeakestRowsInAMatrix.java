package com.github.yck.heap.iterativeUsingHeap;

import cn.hutool.core.lang.Assert;
import org.junit.Test;

import java.util.*;

/**
 *
 * https://leetcode.com/problems/the-k-weakest-rows-in-a-matrix/
 * 这道题比较明显，就是求解 TopN，求其下标。
 *
 * 考察核心主要是编程语言与数据结构
 * 实现 comparable 接口的对象，放到优先队列中即可。
 * 优先队列
 *
 *
 * @author Chengkai Yang
 * @version 1.0
 * @date 2024/2/10 21:42
 */
class KStrongBean implements Comparable<KStrongBean>{
    public KStrongBean(Integer priority, Integer index) {
        this.priority = priority;
        this.index = index;
    }

    public Integer getPriority() {
        return priority;
    }

    public void setPriority(Integer priority) {
        this.priority = priority;
    }

    public Integer getIndex() {
        return index;
    }

    public void setIndex(Integer index) {
        this.index = index;
    }

    public Integer priority;
    public Integer index;

    @Override
    public int compareTo(KStrongBean other) {
        int re = this.priority.compareTo(other.priority);
        if(re!=0){
            return re;
        }else {
            return this.index.compareTo(other.index);
        }
    }
}
class Solution1337 {
    public int[] kWeakestRows(int[][] mat, int k) {
        PriorityQueue<KStrongBean> minHeap =
                new PriorityQueue<>(k,Comparator.reverseOrder());
        int[] re = new int[mat.length];
        int[] reIdx = new int[k];

        for (int i = 0; i < mat.length; i++) {
            // TODO 由于列是有序的，其实可以把迭代换成二分查找
            for (int j = 0; j < mat[i].length; j++) {
                if(mat[i][j] == 0){
                    re[i] = j;
                    break;
                }
                re[i] = j+1;
            }
        }
        // 这里主要配合堆，k放值，value放坐标
        for (int i = 0; i < re.length; i++) {
            minHeap.offer(new KStrongBean(re[i],i));
            if(minHeap.size()>k){
                minHeap.poll();
            }
        }
//        List<Integer> re = new LinkedList<Integer>();
        Integer idx = k - 1;
        while (idx>-1){
            reIdx[idx] = minHeap.poll().getIndex();
            idx --;
        }
        return reIdx;
    }
}
public class TheKWeakestRowsInAMatrix {

    @Test
    public void testBean(){
        KStrongBean KStrongBean1 = new KStrongBean(1, 2);
        KStrongBean KStrongBean2 = new KStrongBean(2, 2);
        KStrongBean KStrongBean3 = new KStrongBean(1, 1);
//        System.out.println();
        Assert.isTrue(KStrongBean1.compareTo(KStrongBean2)<0);
        Assert.isTrue(KStrongBean3.compareTo(KStrongBean2)<0);
    }
    @Test
    public void test(){
        int[][] matrix = {
                {1, 1, 0, 0, 0},
                {1, 1, 1, 1, 0},
                {1, 0, 0, 0, 0},
                {1, 1, 0, 0, 0},
                {1, 1, 1, 1, 1}
        };
        Solution1337 solution1337 = new Solution1337();
        org.junit.Assert.assertArrayEquals(solution1337.kWeakestRows(matrix,3) , new int[]{2,0,3});

    }
}
