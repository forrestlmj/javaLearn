package HashTableTopic;

import org.junit.Test;

public class SortCharactersByFrequencyTest {


    @Test
    public void frequencySort() {
        SortCharactersByFrequency s = new SortCharactersByFrequency();
//        assertEquals("eetr",s.frequencySort("tree"));
//        assertEquals("cccaaa",s.frequencySort("cccaaa"));
//        assertEquals("bbAa",s.frequencySort("Aabb"));

        s.frequencySort("BinaryTree");
        s.frequencySort("cccaaa");
        s.frequencySort("Aabb");

    }
}