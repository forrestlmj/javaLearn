package com.github.yck.ds.hash.history;

import java.util.HashSet;
import java.util.Set;

public class MaximumLengthOfRepeatedSubarray {
    private String sub(int[] l,int s,int e){
        int[] re = new int[e-s];
        StringBuilder sb = new StringBuilder();
        for(int i = s;i<e; i++){
            re[i-s] = l[i];
            sb.append(l[i]);
            sb.append("|");
        }
        return sb.toString();
    }
    public int findLength(int[] A, int[] B) {
        int window = Math.min(A.length,B.length);
        while(window>0){
            Set<String> seen = new HashSet<>();
            for(int i = 0;i+window<=A.length;i++){
                seen.add(sub(A,i,i+window));
            }
            for(int i = 0;i+window<=B.length;i++){
                if(seen.contains(sub(B,i,i+window))){
                    return window;
                }
            }
            window -=1;
        }
        return window;

    }
}
