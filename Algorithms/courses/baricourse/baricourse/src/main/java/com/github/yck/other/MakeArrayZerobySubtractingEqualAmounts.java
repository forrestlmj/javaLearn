package com.github.yck.other;

import java.util.HashSet;
import java.util.Set;

/**
 *
 * https://leetcode.com/problems/make-array-zero-by-subtracting-equal-amounts/
 * @author Chengkai Yang
 * @version 1.0
 * @date 2024/2/11 15:34
 */
class Solution2357 {
    public int minimumOperations(int[] nums) {
        Set<Integer> s = new HashSet<>();
        for (int num : nums) {
            s.add(num);
        }
        if(s.contains(0)){
            return s.size()-1;
        }else {
            return s.size();
        }
    }
}
public class MakeArrayZerobySubtractingEqualAmounts {
}
