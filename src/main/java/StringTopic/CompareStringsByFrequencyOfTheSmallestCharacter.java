package StringTopic;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;

public class CompareStringsByFrequencyOfTheSmallestCharacter {
    public int f(String word){
        HashMap<Character,Integer> counter = new HashMap<Character, Integer>();
        for(char w:word.toCharArray()){
            if(!counter.containsKey(w)){
                counter.put(w,1);
            }else {
                counter.put(w,counter.get(w)+1);
            }
        }
        if(counter.size()>0){
            Character c = (Character) counter.keySet().toArray()[0];
            return counter.get(c);
//            return 1;
        }
        return  0;
    }
    public int binarySearch(int key,int[] array){

        for(int i = 0;i<array.length;i++){
            if(array[i]>key){
                return array.length - i;
            }
        }
        return 0;
    }
    public int[] numSmallerByFrequency(String[] queries, String[] words) {
        int[] q = new int[queries.length];
        int[] w = new int[words.length];
        for(int i = 0;i < w.length; i ++){
            w[i] = f(words[i]);
        }
        Arrays.sort(w);
        for(int j = 0;j<q.length;j++){
            q[j] = binarySearch(f(queries[j]),w);
        }
        return q;
    }
}
