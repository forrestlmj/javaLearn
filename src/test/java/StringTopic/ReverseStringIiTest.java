package StringTopic;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class ReverseStringIiTest {

    @Test
    void reverseStr() {
        ReverseStringIi reverseStringIi = new ReverseStringIi();
        assertEquals("bacdfeg",reverseStringIi.reverseStr("abcdefg",2));
    }
}