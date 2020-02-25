package StringTopic.TopInterviewQuestionsEasy.String32;
public class String32{
    public static void main(String[] args) {
        char[] t = new char[] {'h','e','l','l','o'};  
        Solution s = new Solution();
        s.reverseString(t);
    }

}
class Solution {
    public void reverseString(char[] s) {

        for(int i=0;i<s.length/2;i++){
            char tmp = s[i];
            s[i] = s[s.length-1-i];
            s[s.length-1-i] = tmp;
        }
    }
}