package com.github.yck.ds.tree.history;

import java.util.ArrayList;
import java.util.List;

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode(int x) { val = x; }
 * }
 */

class AllElementsInTwoBinarySearchTrees {
    /*
    解题思路：中序遍历+归并
     */
    public List<Integer> dfs(TreeNode root){
        List<Integer> l = new ArrayList<>();
        if(root == null){
            return l;
        }
        if(root.left != null){
            l.addAll(dfs(root.left));
        }
        l.add(root.val);
        if(root.right != null){
            l.addAll(dfs(root.right));
        }
        return l;


    }
    public List<Integer> getAllElements(TreeNode root1, TreeNode root2) {
        List<Integer> a = dfs(root1);
        System.out.println(a.toString());

        List<Integer> b = dfs(root2);
        System.out.println(b.toString());
        int i = 0;
        int j = 0;
        List<Integer> re = new ArrayList<>();
        while(i<a.size() && j<b.size()){
            if(a.get(i)<b.get(j)){
                re.add(a.get(i));
                i++;
            }else{
                re.add(b.get(j));
                j++;
            }
        }
        while(i<a.size()){
            re.add(a.get(i));
            i++;
        }
        while(j<b.size()){
            re.add(b.get(j));
            j++;
        }
        return re;
    }
}