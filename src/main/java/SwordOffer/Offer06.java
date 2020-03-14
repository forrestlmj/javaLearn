package SwordOffer;

import java.util.ArrayList;
import java.util.List;
public class Offer06{
    public static void main(String[] args) {
        /**
         * https://leetcode-cn.com/problems/cong-wei-dao-tou-da-yin-lian-biao-lcof/
         */
        // System.out.println(1);
        // Solution s = new Solution();
        // System.out.println(s.reversePrint(head))
    }
 
 public class ListNode {
     int val;
     ListNode next;
      ListNode(int x) { val = x; }
 }

class Solution {
    public int[] reversePrint(ListNode head) {
        List<Integer> stack = new ArrayList<>();
        while(head != null){
            stack.add(head.val);
            head =  head.next;
        }
        int[] re = new int [stack.size()];
        for(int i = 0;i<stack.size();i++){
            re[i] = stack.get(stack.size()-i);
        }
        return re;
    }
}
}