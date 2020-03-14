package TopInterviewQuestionsEasy.TopInterviewQuestionsEasy.String36;

import java.util.ArrayList;
import java.util.List;

public class String36 {
    public static void main(String[] args) {
    /** 
     * https://leetcode-cn.com/explore/interview/card/top-interview-questions-easy/5/strings/36/
     * 判断回文字符串，只考虑数字和字母，不考虑大小写
     * 使用Stack类
     * */       
    Solution s = new Solution();
    System.out.println(s.isPalindrome("A man, a plan, a canal: Panama"));
    System.out.println(s.isPalindrome("race a car"));
    }
}
class Solution {
    public boolean isPalindrome(String s) {
        List<Character> l = new ArrayList<>();
        for(Character c:s.toCharArray()){
            if(Character.isLetterOrDigit(c)){
                l.add(Character.toLowerCase(c));
            }
        }
        for(int i = 0;i<l.size()/2;i++){
            if(!l.get(i).equals(l.get(l.size()-1-i))){

                return false;
            }
        }

        return true;
    }
}