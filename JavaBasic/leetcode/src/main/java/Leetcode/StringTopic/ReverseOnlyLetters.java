package Leetcode.StringTopic;

import java.util.Stack;

public class ReverseOnlyLetters {
    public boolean isCH(Character s){
        return (Character.isUpperCase(s) ||Character.isLowerCase(s));
    }
    public String reverseOnlyLetters(String S) {
        Stack<Character> stack = new Stack<Character>();
        for(int i = 0;i<S.length();i++){
            if(isCH(S.charAt(i))){
                stack.push(S.charAt(i));
            }
        }
        StringBuilder st = new StringBuilder();
        for(int i = 0;i<S.length();i++){
            if(isCH(S.charAt(i))){
                st.append(stack.pop());
            }else {
                st.append(S.charAt(i));
            }
        }
        return st.toString();
    }
}
