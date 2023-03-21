package com.github.yck.ds.hash.history;

import org.junit.Before;
import org.junit.Test;

import java.util.HashMap;
import java.util.Map;

import static org.junit.Assert.assertEquals;

class Solution_H_13 {


    public int romanToInt(String s) {
        Integer re = 0;
        Map<Character,Integer> romanInt = new HashMap<>();
        romanInt.put('I',1);
        romanInt.put('V',5);
        romanInt.put('X',10);
        romanInt.put('L',50);
        romanInt.put('C',100);
        romanInt.put('D',500);
        romanInt.put('M',1000);

        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            boolean isMinus = false;

            if (c == 'I' || c == 'X' || c == 'C'){
//                romanInt.get()
                if(i < s.length()-1){
                    char c_next = s.charAt(i + 1);
                    switch (c){
                        case 'I': if(c_next == 'V' || c_next == 'X') isMinus = true; break;
                        case 'X': if(c_next == 'L' || c_next == 'C') isMinus = true; break;
                        case 'C': if(c_next == 'D' || c_next == 'M') isMinus = true; break;

                        default: break;
                    }

                }
            }
            if(isMinus) re -= romanInt.get(c); else re += romanInt.get(c);

        }
        return re;
    }
}

/**
 * https://leetcode.com/problems/roman-to-integer/
 */
public class H_13_RomantoInteger {
    public static void main(String[] args) {

    }

}
