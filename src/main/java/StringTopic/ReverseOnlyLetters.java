package StringTopic;

import java.util.ArrayList;

public class ReverseOnlyLetters {
    public String reverseOnlyLetters(String S) {
        ArrayList<Integer> a = new ArrayList<Integer>();
        char[] s = S.toCharArray();
        for(int i = 0;i<s.length;i++){
            if(!(Character.isUpperCase(s[i]) ||Character.isLowerCase(s[i]))){
                a.add(i);
            }
        }
        StringBuilder st = new StringBuilder();

    }
}
