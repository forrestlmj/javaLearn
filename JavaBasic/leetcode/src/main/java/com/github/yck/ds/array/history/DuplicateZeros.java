package com.github.yck.ds.array.history;

public class DuplicateZeros {
    public void duplicateZeros(int[] arr) {
        int idx = 0;
        while(idx<arr.length){
            if(arr[idx] == 0 ){
                for(int j = arr.length-1;j>arr[idx]+1;j--){
                    arr[j] = arr[j-1];
                }
                idx++;
                arr[idx] = 0;
            }
            idx++;
        }
    }
}
