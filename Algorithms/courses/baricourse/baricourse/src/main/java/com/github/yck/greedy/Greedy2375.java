package com.github.yck.greedy;

import cn.hutool.core.lang.Assert;
import org.junit.Test;

import java.util.HashSet;
import java.util.Set;

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
        StringBuilder sb = new StringBuilder();
        Set<Integer> s = new HashSet<>();
        for (int i = 0; i < 10; i++) {
            s.add(i);
        }
        sb.append(1);
        s.remove(1);
        for (char c : pattern.toCharArray()) {
            switch (c){
                case 'I':{
                    break;

                }
                case 'D':{
                    break;

                }
            }
        }
        return null;
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
