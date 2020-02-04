package HashTableTopic;

import org.junit.Test;

import static org.junit.Assert.*;

public class MaximumLengthOfRepeatedSubarrayTest {

    @Test
    public void findLength() {
        int[] a = new int[] {1, 2, 3, 2, 1};
        int[] b = new int[] {3, 2, 1, 4, 7};
        MaximumLengthOfRepeatedSubarray m = new MaximumLengthOfRepeatedSubarray();
        assertEquals(3,m.findLength(a,b));
    }
}