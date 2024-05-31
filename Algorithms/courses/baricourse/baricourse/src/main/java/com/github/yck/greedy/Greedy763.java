package com.github.yck.greedy;

import cn.hutool.core.lang.Assert;
import org.junit.Test;

import java.util.*;
import java.util.stream.Collectors;

/**
 * @author Chengkai Yang
 * @version 1.0
 * @date 2024/5/30 19:59
 * https://leetcode.com/problems/partition-labels/description/
 * 贪心原则：
 * 1. 计算出每个字符的开头和结束位置后，按顺序合并，
 */

class TupleYck{
    @Override
    public String toString() {
        return "TupleYck{" +
                "startIdx=" + startIdx +
                ", endIdx=" + endIdx +
                '}';
    }
    public Integer getSize(){
        return this.endIdx - this.startIdx + 1;
    }
    public TupleYck(Integer startIdx, Integer endIdx) {
        this.startIdx = startIdx;
        this.endIdx = endIdx;
    }

    Integer startIdx;
    Integer endIdx;
}
class Solution764 {
    public Boolean canMerge(TupleYck a, TupleYck b){
        return !(b.startIdx > a.endIdx);
    }
    public TupleYck merge(TupleYck a, TupleYck b){
        return new TupleYck(Math.min(a.startIdx,b.startIdx),Math.max(a.endIdx,b.endIdx));
    }
    public List<Integer> partitionLabels(String s) {

        List<List<Integer>> subs = new ArrayList<>();
        Map<Character,TupleYck> m = new LinkedHashMap<>();
        char[] charArray = s.toCharArray();
        for (int i = 0; i < charArray.length; i++) {
            char c = charArray[i];
            if(m.containsKey(c)){
                m.get(c).endIdx = i;
            }else {
                TupleYck tupleYck = new TupleYck(i,i);

                m.put(c,tupleYck);
            }
        }
        System.out.println(m);
        Iterator<Character> iterator = m.keySet().iterator();
        Character firstC = iterator.next();
        List<TupleYck> result = new ArrayList<>();
        TupleYck first = m.get(firstC);
        while (iterator.hasNext()){
            TupleYck second = m.get(iterator.next());

            if(canMerge(first,second)){
                first = merge(first,second);
                if (!iterator.hasNext()){
                    result.add(first);
                }
            }else {
                result.add(first);
                first = second;
            }
        }
        List<Integer> collect = result.stream().map(
                t -> t.getSize()
        ).collect(Collectors.toList());
        return  collect;
    }
}
public class Greedy763 {
    @Test
    public void test(){

        Solution764 s = new Solution764();
        // ababcbaca  defegde hijhklij
        String i = "ababcbacadefegdehijhklij";
        System.out.println(i.substring(0,9));
        System.out.println(i.substring(9,16));
        System.out.println(i.substring(16,24));

        Assert.equals(s.partitionLabels("ababcbacadefegdehijhklij"), Arrays.asList(9,7,8));
        Assert.equals(s.partitionLabels("eccbbbbdec"), Arrays.asList(10));
    }
}
