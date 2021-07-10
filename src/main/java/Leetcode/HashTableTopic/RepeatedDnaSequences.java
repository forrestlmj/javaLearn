package Leetcode.HashTableTopic;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class RepeatedDnaSequences {
    public List<String> findRepeatedDnaSequences(String s) {
        Set<String> seen = new HashSet<String>();
        Set<String> re = new HashSet<String>();

        for(int i = 0;i<=s.length()-10;i++){
            if(seen.contains(s.substring(i,i+10))){
                re.add(s.substring(i,i+10));
            }else{
                seen.add(s.substring(i,i+10));
            }

        }
        List<String> l = new ArrayList<>();
        for(String r:re){
            l.add(r);
        }
        return l;
    }
}
