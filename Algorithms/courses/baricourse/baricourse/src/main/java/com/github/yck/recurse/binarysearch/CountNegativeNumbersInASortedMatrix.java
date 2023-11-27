package com.github.yck.recurse.binarysearch;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Chengkai Yang
 * @version 1.0
 * @date 2023/11/27 19:26
 *
 * https://leetcode.com/problems/count-negative-numbers-in-a-sorted-matrix/description/
 *
 * Given a m x n matrix grid which is sorted in non-increasing order both row-wise and column-wise, return the number of negative numbers in grid.
 *
 *
 *
 * Example 1:
 *
 * Input: grid = [[4,3,2,-1],[3,2,1,-1],[1,1,-1,-2],[-1,-1,-2,-3]]
 * Output: 8
 * Explanation: There are 8 negatives number in the matrix.
 * Example 2:
 *
 * Input: grid = [[3,2],[1,0]]
 * Output: 0
 */
public class CountNegativeNumbersInASortedMatrix {
    public static void main(String[] args) {
        int[][] case1 = {{4,3,2,-1},{3,2,1,-1},{1,1,-1,-2},{-1,-1,-2,-3}};
        int[][] case2 = {{3,2},{1,0}};
        List<Solution1351> s = new ArrayList<>();
        s.add(new Solution1351BinarySearchIteratively());
        s.forEach(
                solution1351 -> {
                    System.out.println(solution1351.countNegatives(case1));
                    System.out.println(solution1351.countNegatives(case2));
                }
        );
    }
}
interface Solution1351{
    int countNegatives(int[][] grid) ;

}
class Solution1351BinarySearchIteratively implements Solution1351{


    @Override
    public int countNegatives(int[][] grid) {
//        int sum = grid.length * grid[0].length;
        int ngCnt = 0;
        int low = 0;
        int high = grid[0].length - 1;
        for (int[] ints : grid) {

            int negIndex = findNegIndex(grid[0],low,high);
            high = negIndex;
            ngCnt = ngCnt + (high - negIndex);
        }
        return ngCnt;
    }

    /**
     * Find the index of the first negative nuber
     * @param nums
     * @param low
     * @param high
     * @return
     */
    private int findNegIndex(int[] nums, int low, int high) {
        int index = Integer.MAX_VALUE;
        while (low <= high){
            int mid = low + (high - low) /2;
            if(nums[mid] < 0){
                if(mid > 0){
                    int leftNumber = nums[mid - 1];
                    if(leftNumber >= 0){
                        return mid;
                    }else {
                        high = mid - 1;
                    }
                }else{

                }
            }else{
                low = mid + 1;
            }
        }
        return index;
    }
}