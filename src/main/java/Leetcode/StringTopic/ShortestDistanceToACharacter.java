package Leetcode.StringTopic;

import java.util.ArrayList;
import java.util.List;

public class ShortestDistanceToACharacter {
    public int[] shortestToChar(String S, char C) {
        int[] re = new int[S.length()];
        List<Integer> query = new ArrayList<>();

        for(int i = 0;i<S.length();i++){
            if(C == S.charAt(i)){
                query.add(i);
            }
        }
//        int idx = 0;
        for(int i = 0;i<S.length();i++){
            if(query.size()>0 && query.get(0) == i){
                re[i] = 0;
                query.remove(0);
            }else {
                re[i] = query.get(0)-i;
            }
        }

        return re;
    }
}
