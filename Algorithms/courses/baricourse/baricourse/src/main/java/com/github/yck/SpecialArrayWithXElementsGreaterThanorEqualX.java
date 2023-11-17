package com.github.yck;

import cn.hutool.core.lang.Assert;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * @author Chengkai Yang
 * @version 1.0
 * @date 2023/11/17 14:34
 */
public class SpecialArrayWithXElementsGreaterThanorEqualX {
    public static void main(String[] args) {
        Solution1608 solution1608 = new Solution1608();
        Assert.equals(solution1608.specialArray(new int[]{3, 5}),2);//2
        Assert.equals(solution1608.specialArray(new int[] {0,0}),-1);//-1
        Assert.equals(solution1608.specialArray(new int[] {0,4,3,0,4}),3);//3
        Assert.equals(solution1608.specialArray(new int[] {3,6,7,7,0}),-1);//-1
    }
}
class Solution1608{
    /**
     * Time complexity O(N*LogN)
     * Space complexity O(N)
     * @param nums
     * @return
     */
    public int specialArray(int[] nums) {
        List<Integer> tmp = new ArrayList<Integer>(nums.length);
        for (int i = 0; i < nums.length; i++) {
            tmp.add(nums[i]);
        }
        Collections.sort(tmp, new Comparator<Integer>() {
            @Override
            public int compare(Integer o1, Integer o2) {
                return o2-o1;
            }
        });
        System.out.println(tmp);
        int re = -1;
        for (int i = 0; i < tmp.size(); i++) {
            if( tmp.get(i) >= i+1){
                re = i+1;
            }else{
                break;
            }
        }
        if(re == -1){
            return -1;
        }
        if(tmp.size()>re){
            if(tmp.get(re)>=re){
                return -1;
            }
        }
        return re;
    }
}