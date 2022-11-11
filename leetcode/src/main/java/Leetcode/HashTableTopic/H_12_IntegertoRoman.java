package Leetcode.HashTableTopic;

import org.junit.Test;

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
    public String intToRoman(int num) {
        List<Character> re = new ArrayList<>();
        int mod = 1000;
        int m = num / mod;
        for (int i = 0; i < m; i++) {
            re.add('M');
        }


        int h_rep = (num % mod) % (mod/2);
        num = num % mod;


        if(10*num/mod < 4) {
            tmp(h_rep,'C');
        }else if(10*num/mod == 4) {
            re.add('C');
            re.add('D');
        } else if(10*num/mod > 4 && 10*num/mod < 9){
            re.add('D');
            tmp(h_rep,'C');
        } else if(10*num/mod == 9){
            re.add('C');
            re.add('M');
        }

        StringBuilder sb = new StringBuilder();
        for (Character character : re) {
            sb.append(character);
        }
        return sb.toString();
    }
}
public class H_12_IntegertoRoman {
    public static void main(String[] args) {
        System.out.println(300%1000);
    }



}
