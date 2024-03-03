package com.github.yck.greedy;

import org.junit.Test;

/**
 * @author Chengkai Yang
 * @version 1.0
 * @date 2024/3/3 20:26
 */
class Solution2864 {
    /**
     *      * @param s https://leetcode.com/problems/maximum-odd-binary-number/
     *
     * 这道题比较典型的贪心解法：
     * 多种排列组合，要求最优解
     * 限制：必须是奇数
     * 最优解：要求尽量大
     * N steps：只要最后一位是1，前几位的 1 尽量往前排即可
     * 群友答案：
     *      * https://leetcode.com/problems/maximum-odd-binary-number/solutions/4802402/visual-max-odd-binary-solver-python-python3-javascript-c/
     *     时间复杂度，空间复杂度一样，写起来更直观，更像贪心
     * @return
     */
    public String maximumOddBinaryNumber(String s) {
        char[] charArray = s.toCharArray();
        char[] result = new char[s.length()];
        if (s.length() == 1){
            return s;
        }
        int oneIdx = -1;
        for (int i = 0; i < charArray.length; i++) {
            if (oneIdx < 0){
                if (charArray[i] == '1'){
                    result[s.length()-1] = '1';
                    oneIdx = 0;
                }else {
                }
            }else {
                if (charArray[i] == '1'){

                    result[oneIdx] = '1';
                    oneIdx ++;
                }
            }
        }
        // 补全0
        for (int i = 0; i < result.length; i++) {
            if (result[i] != '1'){
                result[i] = '0';
            }
        }
        return String.valueOf(result);

    }
}
public class MaximumOddBinaryNumber {
    @Test
    public void test(){
        Solution2864 s = new Solution2864();
        System.out.println(s.maximumOddBinaryNumber("010"));
        System.out.println(s.maximumOddBinaryNumber("0101"));
    }
}
