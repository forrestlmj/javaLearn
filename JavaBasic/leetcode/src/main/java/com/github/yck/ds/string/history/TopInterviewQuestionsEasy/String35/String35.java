package com.github.yck.ds.string.history.TopInterviewQuestionsEasy.String35;


public class String35{
    public static void main(String[] args) {
        /**
         * https://leetcode-cn.com/explore/interview/card/top-interview-questions-easy/5/strings/35/
         * 思路重要是用散列表进行去重,这里如果都是小写的字母可以简化问题直接使用 26个字符串数组进行计数。
         */
        // System.out.println(1);
        Solution s = new Solution();
        System.out.println(s.isAnagram("anagram", "nagaram"));
        System.out.println(s.isAnagram("rat", "car"));
    
    }
}
class Solution {
    public boolean isAnagram(String s, String t) {
        int[] counter = new int[26];
        for (char c:s.toCharArray()){
            // System.out.println((int)c-97);
            counter[(int)c - 97] ++;
        }
        for (char c:t.toCharArray()){
            counter[(int)c - 97] --;
        }
        for(int i:counter){
            if(i != 0){
                return false;
            }
        }
        return true;
    }
}