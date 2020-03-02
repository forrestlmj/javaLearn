package StringTopic.TopInterviewQuestionsEasy.String34;
import java.util.Map;
import java.util.HashMap;
public class String34{
    public static void main(String[] args) {
        // System.out.println(1);
        Solution s = new Solution();
        System.out.println(s.firstUniqChar("leetcode"));
        System.out.println(s.firstUniqChar("loveleetcode"));
    }
}
class Solution {
    public int firstUniqChar(String s) {
        Map<Character,Integer> m = new HashMap<>();
        char[] s_char = s.toCharArray();
        for(int i = 0;i < s_char.length;i++){
            if(m.containsKey(s_char[i])){
                if(m.get(s_char[i]) > -1){
                    m.put(s_char[i],-1);
                }
            }else{
                m.put(s_char[i],i);
            }
        }
        int re = s.length();
        for(int i:m.values()){
            if(i>=0){
                re = Math.min(re, i);
            }
        }
        if(re == s.length()){
            return -1;
        }
        return re;
    }
}