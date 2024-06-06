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
 * 字符串翻转
 * https://leetcode.com/problems/construct-smallest-number-from-di-string/solutions/4787222/fast-simple-java-solution/
 * * 这个比较符合贪心算法 TODO
 * 1. 贪心目的：能产生的最小数字。
 * 2. 限制 D 与 I，每一步都必须只能使用一个数字。那就是每一步要选择最小的，类似拿到工作调度的题目
 */
class Solution2375  {
    public String smallestNumber(String pattern) {
        StringBuilder s = new StringBuilder("123456789".substring(0, pattern.length() + 1));
        int j = 0;

        for (int i = 0; i <= pattern.length(); i++) {
            if (i < pattern.length() && pattern.charAt(i) == 'D') {
                j++;
                continue;
            }

            if (j > 0) {
                StringBuilder ns = new StringBuilder(s.substring(i - j, i + 1));
                s.replace(i - j, i + 1, ns.reverse().toString());
            }

            j = 0;
        }

        return s.toString();
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
