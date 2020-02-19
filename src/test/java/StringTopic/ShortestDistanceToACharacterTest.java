package StringTopic;

import org.junit.Test;

import static org.junit.Assert.*;

public class ShortestDistanceToACharacterTest {

    @Test
    public void shortestToChar() {
        ShortestDistanceToACharacter s = new ShortestDistanceToACharacter();
        s.shortestToChar("loveleetcode",'e');
    }
}