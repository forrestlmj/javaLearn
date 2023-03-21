package com.github.yck.ds.string.history;


import java.util.HashSet;

public class GoatLatin {
    HashSet<Character> ch = new HashSet<Character>();
    public GoatLatin(){
        ch.add('a');
        ch.add('e');
        ch.add('i');
        ch.add('o');
        ch.add('u');
        ch.add('A');
        ch.add('E');
        ch.add('I');
        ch.add('O');
        ch.add('U');
    }
    public String toGoatLatin(String S) {
        String[] sList = S.split(" ");

//        String[] s =
        StringBuilder st = new StringBuilder();
        for(int i = 0;i<sList.length;i++){
//            char[] append = new char[i+1];
            StringBuilder block = new StringBuilder();
            for(int j = 0;j<i+1;j++){
                block.append("a");
            }
            String newWord = change(sList[i])+block.toString();
            if(i<sList.length-1){
                newWord = newWord + " ";
            }
//            System.out.println(newWord);
            st.append(newWord);
        }
        return st.toString();
    }

    private String change(String word) {
        char c = word.charAt(0);
        if(ch.contains(c)){
//            word =;
        }else {
            word = word.substring(1,word.length())+c;
        }
        return  word+"ma";
    }


}
