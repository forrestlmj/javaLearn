package com.github.yck.ds.array.history;

public class array31 {
    public void rotate(int[][] matrix) {
        int n = matrix.length;
        //先转置，后翻转
        for(int i = 0;i<n;i++){
            for(int j = i;j<n;j++){
                int tmp = matrix[j][i];
                matrix[j][i] = matrix[i][j];
                matrix[i][j] = tmp;
            }
        }
        //翻转 注意翻转时候结束是数组中点
        for(int i = 0;i<n;i++){
            for(int j = 0;j<n / 2;j++){
                int tmp = matrix[i][n-1-j];
                matrix[i][n-1-j] = matrix[i][j];
                matrix[i][j] = tmp;

            }
        }
    }
}
