package Leetcode.HashTableTopic;

import org.junit.Before;
import org.junit.Test;

import java.util.HashMap;
import java.util.Map;

import static org.junit.Assert.assertEquals;

class Solution {


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
public class H_13_RomantoInteger {
    public static void main(String[] args) {

    }
    private Solution s = new Solution();
    @Test
    public void test(){
        assertEquals(3,s.romanToInt("III"));
        assertEquals(58,s.romanToInt("LVIII"));
        assertEquals(1994,s.romanToInt("MCMXCIV"));


        assertEquals(1,s.romanToInt("I"));
        assertEquals(2,s.romanToInt("II"));
    }
}
