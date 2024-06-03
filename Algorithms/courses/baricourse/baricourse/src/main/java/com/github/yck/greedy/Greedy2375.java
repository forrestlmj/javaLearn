package com.github.yck.greedy;

import cn.hutool.core.lang.Assert;
import org.junit.Test;

import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * @author Chengkai Yang
 * @version 1.0
 * @date 2024/6/3 20:10
 *
 * https://leetcode.com/problems/construct-smallest-number-from-di-string/description/
 * 这个比较符合贪心算法 TODO
 * 1. 贪心目的：能产生的最小数字。
 * 2. 限制 D 与 I，每一步都必须只能使用一个数字。那就是每一步要选择最小的，类似拿到工作调度的题目
 */
class Solution2375 {
    public String smallestNumber(String pattern) {
        List<Integer> result = new ArrayList<>();

        PriorityQueue<Integer> minHeap = new PriorityQueue<>();
        for (int i = 2; i < 10; i++) {
            minHeap.offer(i);
        }

        result.add(1);
        for (char c : pattern.toCharArray()) {
            switch (c){
                case 'I':{
                    Integer number = minHeap.poll();

                    result.add(number);
                    break;
                }
                case 'D':{
                    // 取左边的值
                    Integer i = result.get(result.size() - 1);
                    // 还回队列
                    minHeap.offer(i);
                    // 先给当前值拿一个
                    // 再给前面的拿一个
                    int lastIdx = result.size()-1;
                    result.add(minHeap.poll());
                    result.set(lastIdx,minHeap.poll());

                    break;

                }
            }
        }
        StringBuilder sb = new StringBuilder();
        for (Integer i : result) {
            sb.append(i);
        }
        return sb.toString();
    }
}
public class Greedy2375 {
    @Test
    public void test(){
        Solution2375 s = new Solution2375();
        Assert.equals("123549876",s.smallestNumber("IIIDIDDD"));
        Assert.equals("4321",s.smallestNumber("DDD"));
    }
}
