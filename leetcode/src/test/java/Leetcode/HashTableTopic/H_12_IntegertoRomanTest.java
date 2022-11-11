package Leetcode.HashTableTopic;

import org.junit.Test;

import static org.junit.Assert.*;

public class H_12_IntegertoRomanTest {
    @Test
    public void test(){

        Solution_H_12 solution_h_121 = new Solution_H_12();
//        System.out.println(500%500);
        assertEquals(solution_h_121.intToRoman(1993),"MCM");
    }
}