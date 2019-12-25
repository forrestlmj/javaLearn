package StringTopic;

import java.util.ArrayList;
import java.util.HashMap;

public class ReverseOnlyLetters {
    public String reverseOnlyLetters(String S) {
        HashMap<Integer,Character> a = new HashMap<Integer, Character>();
        char[] s = S.toCharArray();
        for(int i = 0;i<s.length;i++){
            if(!(Character.isUpperCase(s[i]) ||Character.isLowerCase(s[i]))){
                a.put(i,s[i]);
            }
        }
        StringBuilder st = new StringBuilder();
        int j = 0;
        for(int i = s.length - 1;i>=0;i--){
            if(a.containsKey(j)){
                st.append(a.get(j));
                j++;
                i++;
            }else {
                if((Character.isUpperCase(s[i]) ||Character.isLowerCase(s[i]))) {
                    st.append(s[i]);
//                i--;
                    j++;
                }
            }


        }
        return st.toString();
    }
}
