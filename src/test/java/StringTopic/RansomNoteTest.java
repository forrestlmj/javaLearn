package StringTopic;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class RansomNoteTest {

    @Test
    void canConstruct() {
        RansomNote ransomNote = new RansomNote();
//        assertFalse(ransomNote.canConstruct("a","b"));
        assertFalse(ransomNote.canConstruct("aa","ab"));
        assertTrue(ransomNote.canConstruct("aa","aab"));

    }
}