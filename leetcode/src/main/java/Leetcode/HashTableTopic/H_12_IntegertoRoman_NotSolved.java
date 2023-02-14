package Leetcode.HashTableTopic;

import java.util.ArrayList;
import java.util.List;

/**
 * https://leetcode.com/problems/integer-to-roman/
 */
class Solution_H_12{

    public List<Character> tmp(int n, Character c){
        List<Character> re = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            re.add(c);
        }
        return re;
    }
    public Integer generate(List<Character> re, int num, int mod, char upper, char middle, char flour){
//        if)
        int m = num / mod;
        for (int i = 0; i < m; i++) {
            re.add(upper);
        }


        int h_rep = (num % mod) % (mod/2);
        num = num % mod;

        if(10*num/mod < 4) {
            tmp(h_rep,flour);
        }else if(10*num/mod == 4) {
            re.add(flour);
            re.add(middle);
        } else if(10*num/mod > 4 && 10*num/mod < 9){
            re.add(middle);
            tmp(h_rep,flour);
        } else if(10*num/mod == 9){
            re.add(flour);
            re.add(upper);
        }
        return num;
    }
    public String intToRoman(int num) {
        List<Character> re = new ArrayList<>();
        num = generate(re,num,1000,'M','D','C');
        num = generate(re,num,100,'C','L','X');
        num = generate(re,num,10,'X','V','I');

        StringBuilder sb = new StringBuilder();
        for (Character character : re) {
            sb.append(character);
        }
        return sb.toString();
    }
}
public class H_12_IntegertoRoman_NotSolved {
    public static void main(String[] args) {
        System.out.println(300%1000);
    }



}
