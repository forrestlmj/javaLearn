package com.github.yck.sort.mergesort.merge;

/**
 * https://leetcode.com/problems/merge-two-sorted-lists/
 * @author Chengkai Yang
 * @version 1.0
 * @date 2024/2/14 15:58
 */
/**
 * https://leetcode.com/problems/merge-two-sorted-lists/
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode() {}
 *     ListNode(int val) { this.val = val; }
 *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }
 * }
 */
  class ListNode {
     int val;
     ListNode next;
     ListNode() {}
     ListNode(int val) { this.val = val; }
     ListNode(int val, ListNode next) { this.val = val; this.next = next; }
 }
class Solution21 {
    public ListNode mergeTwoLists(ListNode list1, ListNode list2) {
        ListNode idx = new ListNode();
        ListNode startNode = idx;
        while (list1 != null && list2 != null){
            if(list1.val<list2.val){
                idx.next = new ListNode(list1.val);
                list1 = list1.next;
            }else {
                idx.next = new ListNode(list2.val);
                list2 = list2.next;
            }
            idx = idx.next;
        }
        while(list1 != null){
            idx.next = new ListNode(list1.val);
            idx = idx.next;
            list1 = list1.next;
        }
        while(list2 != null){
            idx.next = new ListNode(list2.val);
            idx = idx.next;
            list2 = list2.next;
        }
        return startNode.next;
    }
}
public class MergeTwoSortedLists {
}
