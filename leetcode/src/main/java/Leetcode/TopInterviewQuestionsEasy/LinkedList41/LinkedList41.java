package Leetcode.TopInterviewQuestionsEasy.LinkedList41;
public class LinkedList41{
    public static void main(String[] args) {
        Solution s = new Solution();
        /**
         * https://leetcode-cn.com/explore/interview/card/top-interview-questions-easy/6/linked-list/41/
         */
    }
}
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) { val = x; }
 * }
 */
class ListNode {
        int val;
        ListNode next;
        ListNode(int x) { val = x; }
}
class Solution {
    public void deleteNode(ListNode node) {
        node.val = node.next.val;
        node.next = node.next.next;        
    }
}