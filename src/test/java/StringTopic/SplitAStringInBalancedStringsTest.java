package StringTopic;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class SplitAStringInBalancedStringsTest {

    SplitAStringInBalancedStrings splitAStringInBalancedStrings = new SplitAStringInBalancedStrings();

    @BeforeEach
    void setUp() {
    }

    @Test
    void balancedStringSplit() {
        assertEquals(1,splitAStringInBalancedStrings.balancedStringSplit("LR"));
    }
}