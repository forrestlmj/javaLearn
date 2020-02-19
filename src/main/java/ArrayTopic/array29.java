package ArrayTopic;

import java.util.HashMap;
import java.util.Map;

//https://leetcode-cn.com/explore/interview/card/top-interview-questions-easy/1/array/29/
public class array29 {
    /*
    hash表去重
     */
    public int[] twoSum(int[] nums, int target) {
        Map<Integer,Integer> map = new HashMap<>();
        for(int i = 0;i<nums.length;i++){
            if(map.containsKey(target-nums[i])){
                return new int[] {map.get(target-nums[i]),i};
            }
            map.put(nums[i],i);
        }
        throw new IllegalArgumentException("No two sum solution");
    }
}
