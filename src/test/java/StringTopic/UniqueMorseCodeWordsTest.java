package StringTopic;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class UniqueMorseCodeWordsTest {
    private UniqueMorseCodeWords uniqueMorseCodeWords = new UniqueMorseCodeWords();
    @Test
    void uniqueMorseRepresentations() {
        String[] s ={"gin", "zen", "gig", "msg"};
        assertEquals(2,uniqueMorseCodeWords.uniqueMorseRepresentations(s));
        System.out.println((byte)'a'-97);
    }
}