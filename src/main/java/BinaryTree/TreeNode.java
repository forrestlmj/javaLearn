package BinaryTree;

import StringTopic.Test;

public class TreeNode {
    int val;
    TreeNode left;
    TreeNode right;
    TreeNode(int val){
        this.val = val;
    }

    TreeNode(int val,TreeNode left,TreeNode right){
        this.val = val;
        if(left != null){
            this.left = new TreeNode(left.val,left.left,left.right);
        }
        if(right != null){
            this.right = new TreeNode(right.val,right.left,right.right);
        }
    }
}
