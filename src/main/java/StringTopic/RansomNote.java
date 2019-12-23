package StringTopic;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;

public class RansomNote {
    public boolean canConstruct(String ransomNote, String magazine) {
        HashMap<Character, Long> count = new HashMap<Character, Long>();
        for(char m:magazine.toCharArray()){
            if(!count.containsKey(m)){
                count.put(m, (long) 1);
            }else {
                count.put(m,count.get(m)+1);
            }
        }
        for(char r:ransomNote.toCharArray()){
            if(!count.containsKey(r)){
                return false;
            }else {
                if(count.get(r)==0){
                    return false;
                }else {
                    count.put(r,count.get(r)-1);
                }
            }
        }
        return true;
    }
}
