package StringTopic;


import java.util.ArrayList;
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
        String[] sList = S.split("S");

//        String[] s =
        ArrayList<String> re = new ArrayList<String>();
        StringBuilder st = new StringBuilder();
        for(int i = 0;i<sList.length;i++){
            char[] append = new char[i+1];
            String newWord = change(sList[i])+append+" ";
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
