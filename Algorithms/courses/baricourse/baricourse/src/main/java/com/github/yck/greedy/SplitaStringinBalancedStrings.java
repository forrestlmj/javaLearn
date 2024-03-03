package com.github.yck.greedy;

/**
 * @author Chengkai Yang
 * @version 1.0
 * @date 2024/3/3 20:16
 */
class Solution1221 {
    /**https://leetcode.com/problems/split-a-string-in-balanced-strings/
     *
     * 这道题没看出哪里贪心了？由于输入已经是 balanced 了。
     * 同时要求子字符串，那就必须按照循序去切，那就是从左到右只要LR得0那就是贪心了？求最大？
     * @param s
     * @return
     */
    public int balancedStringSplit(String s) {
        String[] chars = s.split("");
        int re = 0;
        int cnt = 0;
        for (String aChar : chars) {
            if (aChar.equals("L")){
                re ++;
            }else {
                re --;
            }

            if (re == 0){
                cnt ++;
            }
        }
        return cnt;
    }
}
public class SplitaStringinBalancedStrings {
}
