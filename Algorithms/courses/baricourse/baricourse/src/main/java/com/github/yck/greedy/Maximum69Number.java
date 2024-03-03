package com.github.yck.greedy;

import org.junit.Test;

/**
 * @author Chengkai Yang
 * @version 1.0
 * @date 2024/3/3 20:51
 */
class Solution1323 {
    /**
     * https://leetcode.com/problems/maximum-69-number/
     * 非常直观，就是第一位6改为9
     * @param num
     * @return
     */
    public int maximum69Number (int num) {
        char[] re = String.valueOf(num).toCharArray();
        int numDigits = (int) Math.log10(num) + 1;
        int j = 0;
        for (int i = numDigits - 1; i >= 0; i--) {
            int divisor = (int) Math.pow(10, i);
            int digit = num / divisor;
            if (digit == 6){
                re[numDigits - i - 1] = '9';
                break;
            }
            num %= divisor;
        }
        return Integer.valueOf(String.valueOf(re));
    }
}
public class Maximum69Number {
    @Test
    public void test(){
        Solution1323 s = new Solution1323();
        System.out.println(s.maximum69Number(9669));
    }
}
