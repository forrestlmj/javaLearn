package com.github.yck.ds.linkedlist.history;
import java.util.*;

public class LinkedList42{
    public ListNode removeNthFromEnd(ListNode head, final int n) {
        final Map<Integer, ListNode> d = new HashMap<>();
        final ListNode dummy = new ListNode(-1);
        dummy.next = head;
        Integer id = 1;
        d.put(0,dummy);
        while(head != null){
            d.put(id,head);
            head = head.next;
            id++;
        }
        ListNode a = d.get(id - n -1);
        ListNode b = d.get(id - n);
        a.next = b.next;
        return dummy.next;
    }
    public static void main(final String[] args) {
        
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
    ListNode(final int x) { val = x; }
}
