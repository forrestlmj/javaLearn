package BinaryTree;

import org.junit.Test;

import java.util.ArrayList;

import static org.junit.Assert.*;

public class AllElementsInTwoBinarySearchTreesTest {

    @Test
    public void dfs() {
//        TreeNode t = new TreeNode(2,new TreeNode(1),new TreeNode(4));
        AllElementsInTwoBinarySearchTrees a = new AllElementsInTwoBinarySearchTrees();
//        System.out.printf(a.dfs(t).toString());
//        TreeNode t1 = new TreeNode(1,new TreeNode(0),new TreeNode(3));
//        System.out.printf(a.dfs(t1).toString());
        TreeNode t3 = new TreeNode(1,new TreeNode(0,null,null),new TreeNode(2,null,null));
        TreeNode t2 = new TreeNode(5,t3,
                                        new TreeNode(7));
        System.out.printf(a.dfs(t2).toString());

    }

    @Test
    public void getAllElements() {
    }
}