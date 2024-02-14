package com.github.yck.sort.mergesort.merge;

import org.junit.Test;

/**
 * https://leetcode.com/problems/merge-strings-alternately/
 * @author Chengkai Yang
 * @version 1.0
 * @date 2024/2/14 16:20
 */

class Solution1768{
    public String mergeAlternately(String word1, String word2) {
        char[] charArray1 = word1.toCharArray();
        char[] charArray2 = word2.toCharArray();
        char[] re = new char[charArray1.length + charArray2.length];
        int a = 0;
        int b = 0;
        int reIdx = 0;
        boolean A = true;
        while (a<charArray1.length && b<charArray2.length){
            if(A){
                re[reIdx++] = charArray1[a++];
                A = false;
            }else {
                re[reIdx++] = charArray2[b++];
                A = true;
            }
        }
        while (a<charArray1.length){
            re[reIdx++] = charArray1[a];
            a++;
        }
        while (b<charArray2.length){
            re[reIdx++] = charArray2[b];
            b++;
        }
        return String.valueOf(re);
    }
}


public class MergeStringsAlternately {
    @Test
    public void test(){
        Solution1768 solution1768 = new Solution1768();
        System.out.println(solution1768.mergeAlternately("ab", "pqrs"));
    }
}
