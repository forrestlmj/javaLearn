package StringTopic;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashSet;

/**
 * 知识点，morse映射，与hashset去重
 *
 */
public class UniqueMorseCodeWords {
    private final String[] morse = {".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."};

    public int uniqueMorseRepresentations(String[] words) {
        HashSet<String> hashSet = new HashSet<String>();
        for(String word:words){
            StringBuffer s = new StringBuffer();
            for (char c:word.toCharArray()){
                s.append(morse[(byte)c-97]);
            }
//            System.out.println(s);
            hashSet.add(s.toString());
        }
        return hashSet.size();
    }
}
