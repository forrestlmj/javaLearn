package com.github.yck.ds.stack;

import java.util.Stack;

/**
 * https://leetcode.cn/problems/goal-parser-interpretation/
 */
public class GoalParserInterpretation {
    public String interpret(String command) {
//        final String
        StringBuilder sb = new StringBuilder();
        char[] chars = command.toCharArray();
        Stack<Character> st = new Stack<>();

        for (char aChar : chars) {
            st.push(aChar);
            switch (st.peek()){
                case 'G': st.pop();sb.append('G');break;
                case ')':
                    st.pop();
                    if (st.peek()=='('){
                        st.pop();
                        sb.append("o");
                    }else {
                        st.pop();st.pop();st.pop();
                        sb.append("al");
                    }break;
            }
        }


        return sb.toString();
    }
    public static void main(String[] args) {
        GoalParserInterpretation g = new GoalParserInterpretation();
        System.out.println(g.interpret("G()(al)"));
        System.out.println(g.interpret("G()()()()(al)"));
        System.out.println(g.interpret("(al)G(al)()()G"));
    }
}
