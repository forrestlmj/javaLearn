package HashTableTopic;

import java.util.*;

public class SortCharactersByFrequency {
    /**
     * TODO 用到了TreeMap
     * @param s
     * @return
     */
    public String frequencySort(String s) {
        Map<Character,Integer> map = new HashMap<Character, Integer>();
        for(char c:s.toCharArray()){
            if(!map.containsKey(c)){
                map.put(c,1);
            }else{
                map.put(c,map.get(c)+1);
            }
        }
        SortedMap<Integer, ArrayList> sortedMap = new TreeMap<Integer, ArrayList>(Collections.<Integer>reverseOrder());
        for(Character c:map.keySet()){
            if(!sortedMap.containsKey(map.get(c))){
                ArrayList<Character> list = new ArrayList<Character>();
                list.add(c);
                sortedMap.put(map.get(c),list);
            }else {
                ArrayList<Character> list = sortedMap.get(map.get(c));
                list.add(c);
            }
        }
        StringBuilder sb = new StringBuilder();
        for(Integer timer:sortedMap.keySet()){
            ArrayList<Character> line = sortedMap.get(timer);
            for(Character c:line){
                for(int i = 0;i<timer;i++){
                    sb.append(c);
                }
            }
        }
        return sb.toString();
    }
}
