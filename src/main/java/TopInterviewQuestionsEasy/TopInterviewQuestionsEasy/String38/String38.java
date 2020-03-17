package TopInterviewQuestionsEasy.TopInterviewQuestionsEasy.String38;
public class String38{
    public static void main(String[] args) {
        Solution s = new Solution();
        System.out.println(s.strStr("hello", "ll"));
        System.out.println(s.strStr("aaaaa", "bba"));
    }

}
class Solution {

    public int strStr(String haystack, String needle) {
        int pos = -1;
        for(int i = 0;i<=haystack.length()-needle.length();i++){
            if(needle.equals(haystack.substring(i,i+needle.length()))){
                return i;
            }
        }
        return pos;
    }
}
class Solution2 {
    
    public int strStr(String haystack, String needle) {
        int pos = -1;
        // for()
        return pos;
    }
}