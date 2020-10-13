package Leetcode.LinkedList;

public class MergeTwoSortedLists {
    public ListNode mergeTwoLists(ListNode l1, ListNode l2) {
        ListNode dummy = new ListNode(-1);
        ListNode tmp = new ListNode(-1);
        dummy = tmp;

        while(l1 != null && l2 != null){

            if(l1.val<l2.val){
                tmp.next = new ListNode(l1.val);
                l1 = l1.next;
            }else{
                tmp.next = new ListNode(l2.val);
                l2 = l2.next;
            }
            tmp = tmp.next;
        }
        while(l1 != null){
            tmp.next = new ListNode(l1.val);
            l1 = l1.next;
            tmp = tmp.next;

        }
        while(l2 != null){
            tmp.next = new ListNode(l2.val);
            l2 = l2.next;
            tmp = tmp.next;
        }
        return dummy.next;
    }
}
