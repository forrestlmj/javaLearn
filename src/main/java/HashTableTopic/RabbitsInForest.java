package HashTableTopic;

import java.util.*;

public class RabbitsInForest {
    public int numRabbits(int[] answers) {
        Map<Integer,Integer> seen = new HashMap<>();
        Integer re = 0;
        ArrayList<Integer> sum = new ArrayList<>();
        for(int i:answers){
            if(!seen.containsKey(i+1)){
                // 新颜色 数量与之前的不一样
                seen.put(i+1,1);
                sum.add(i+1);
            }else {
                if(seen.get(i+1)>i){
                    // 新颜色 数量与之前一样
                    seen.put(i+1,1);
                    sum.add(i+1);
                }else {
                    //旧颜色
                    seen.put(i+1,seen.get(i+1)+1);
                }
            }
        }

        for(Integer count:sum){
            re+=count;
        }
        return re;
    }
}
