package Leetcode.ArrayTopic;

//https://leetcode-cn.com/explore/interview/card/top-interview-questions-easy/1/array/27/
public class array27 {
    /*
    数组移动
     */
    public static void main(String[] args) {
        System.out.println("xxsdfsd");
    }
    public int[] plusOne(int[] digits) {
        int idx = digits.length-1;
        int carry = 1;
        while(idx>-1){
            digits[idx] += carry;
            if(digits[idx]%10==0){
                digits[idx] = 0;
                idx --;
            }else{
                return digits;
            }
        }
        int[] re = new int[digits.length+1];
        re[0] = 1;
        for(int i=0;i<digits.length;i++){
            re[i+1] = digits[i];
        }
        return re;

    }
}
