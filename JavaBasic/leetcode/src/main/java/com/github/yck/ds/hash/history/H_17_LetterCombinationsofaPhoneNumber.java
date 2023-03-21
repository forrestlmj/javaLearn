package com.github.yck.ds.hash.history;

import java.util.*;

class Solution_H_17 {
    public List<String> letterCombinations(String digits) {
        Map<Character,String > phone = new HashMap<>();
        phone.put('2',"abc");
        phone.put('3',"def");
        phone.put('4',"ghi");
        phone.put('5',"jkl");
        phone.put('6',"mno");
        phone.put('7',"pqrs");
        phone.put('8',"tuv");
        phone.put('9',"wxyz");
        List<String > a =new ArrayList<>();
        HashSet<String> tmp1 = new HashSet<>();
        HashSet<String> tmp2 = new HashSet<>();

        for (char digit : digits.toCharArray()) {
            if (tmp1.isEmpty()){
                for (char c : phone.get(digit).toCharArray()) {
                    tmp1.add(String.valueOf(c));
                }
            }else {
                for (String s : tmp1) {
                    for (char c : phone.get(digit).toCharArray()) {
                        tmp2.add(s+c);
                    }
                }
//                tmp1.clear();
                for (String s : tmp2) {
                    tmp1.add(s);
                }
//                tmp2.clear();
            }
        }
        ArrayList<String> re = new ArrayList<>();
        for (String s : tmp1) {
            if (s.length() == digits.length()){
                re.add(s);
            }
        }
        return re;
    }

}
public class H_17_LetterCombinationsofaPhoneNumber {
    public static void main(String[] args) {

    }
}
