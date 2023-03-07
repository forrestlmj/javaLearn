package Leetcode.HashTableTopic;

import org.junit.Test;

import static org.junit.Assert.*;

public class H_13_RomantoIntegerTest {
    private Solution_H_13 s = new Solution_H_13();
    @Test
    public void test(){
        assertEquals(3,s.romanToInt("III"));
        assertEquals(58,s.romanToInt("LVIII"));
        assertEquals(1994,s.romanToInt("MCMXCIV"));


        assertEquals(1,s.romanToInt("I"));
        assertEquals(2,s.romanToInt("II"));
    }
}