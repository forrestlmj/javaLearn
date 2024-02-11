package com.github.yck.heap.iterativeUsingHeap;

import java.util.Comparator;
import java.util.HashMap;
import java.util.Map;
import java.util.PriorityQueue;

/**
 * https://leetcode.com/problems/relative-ranks/
 * @author Chengkai Yang
 * @version 1.0
 * @date 2024/2/11 17:08
 */

class RankBean implements Comparable<RankBean>{
    public Integer idx;
    public Integer score;

    public RankBean(Integer idx, Integer score) {
        this.idx = idx;
        this.score = score;
    }

    @Override
    public String toString() {
        return super.toString();
    }

    @Override
    public int compareTo(RankBean o) {
        return Integer.compare(this.score,o.score);
    }
}
class Solution506 {
    /**
     * 核心还是要把其他信息（这里就是输入数组的idx）放入到堆中
     * 这里做法还是定义一个 bean，保存各类信息，放到堆中。
     *
     * @param score
     * @return
     */
    public String[] findRelativeRanks(int[] score) {
        Map<Integer,String> map = new HashMap<Integer,String >(){{
            put(1,"Gold Medal");
            put(2,"Silver Medal");
            put(3,"Bronze Medal");
        }};

        PriorityQueue<RankBean> maxHeap = new PriorityQueue<>(score.length,Comparator.reverseOrder());
        String[] re = new String[score.length];
        for (int i = 0; i < score.length; i++) {
            maxHeap.offer(new RankBean(i,score[i]));
        }

        int rank = 1;
        while (maxHeap.size()>0){
            RankBean poll = maxHeap.poll();
            re[poll.idx] = map.getOrDefault(rank,String.valueOf(rank));

            rank++;
        }
        return re;
    }
}
public class RelativeRanks {
}
