package com.github.yck.greedy;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * @author Chengkai Yang
 * @version 1.0
 * @date 2024/3/3 19:59
 *
 *
 */

class Solution2160 {
    /**
     *  * https://leetcode.com/problems/minimum-sum-of-four-digit-number-after-splitting-digits/description/
     * 此问题符合贪心算法的要求，因为问题子结构是只要每个数字都最小，和也是最小。
     * 问题长什么样？
     * 1. 有限制：答案必须从给的4个数字组合。
     * 2. 最优化目标：答案的和最小。
     * 2. N-steps：通过排序4个数字，大数字分给两个数字的低位。即可
     * @param num
     * @return
     */
    public int minimumSum(int num) {
        List<Integer> digits = new ArrayList<Integer>(4);
        while (num > 0){
            digits.add(num % 10);
            num /= 10;
        }
        Collections.sort(digits,Collections.reverseOrder());
        int i = digits.get(0) + digits.get(1) + digits.get(2) * 10 + digits.get(3) * 10;
        return i;
    }
}
public class MinimumSumofFourDigitNumberAfterSplittingDigits {
}
