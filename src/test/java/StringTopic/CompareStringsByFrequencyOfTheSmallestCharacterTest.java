package StringTopic;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class CompareStringsByFrequencyOfTheSmallestCharacterTest {

    @org.junit.jupiter.api.Test
    void numSmallerByFrequency() {
    }

    @Test
    void testNumSmallerByFrequency() {
        CompareStringsByFrequencyOfTheSmallestCharacter c = new CompareStringsByFrequencyOfTheSmallestCharacter();
        String[] queries = {"cbd"};
        String[] words = {"zaaaz"};
        System.out.println(c.numSmallerByFrequency(queries,words));

    }
    @Test
    void testNumSmallerByFrequency_2() {
        CompareStringsByFrequencyOfTheSmallestCharacter c = new CompareStringsByFrequencyOfTheSmallestCharacter();
        String[] queries = {"bbb","cc"};
        String[] words = {"aaaa","a","aa","aaa"};
        System.out.println(c.numSmallerByFrequency(queries,words));
    }
    @Test
    void testf(){
        CompareStringsByFrequencyOfTheSmallestCharacter c = new CompareStringsByFrequencyOfTheSmallestCharacter();
        assertEquals(4,c.f("aaaabb"));
        assertEquals( 4,c.f("baaaabb"));
        assertEquals( 3,c.f("bbb"));
        assertEquals( 2,c.f("cc"));
        assertEquals( 3,c.f("zaaaz"));
        assertEquals( 1,c.f("ccbddd"));

    }

    @Test
    void binarySearch() {
        CompareStringsByFrequencyOfTheSmallestCharacter c = new CompareStringsByFrequencyOfTheSmallestCharacter();
        int[] s = {1,2,3,4};
        assertEquals(0,c.binarySearch(4,s));
        assertEquals(3,c.binarySearch(1,s));
        assertEquals(2,c.binarySearch(2,s));
        assertEquals(1,c.binarySearch(3,s));

    }
}