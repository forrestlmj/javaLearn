package StringTopic;

import org.junit.Before;
import org.junit.jupiter.api.Test;

import javax.xml.soap.Detail;

import static org.junit.jupiter.api.Assertions.*;

class DetectCapitalTest {
    DetectCapital detectCapital = new DetectCapital();
//    @Before

    @Test
    void detectCapitalUse() {
        assertTrue(detectCapital.detectCapitalUse("USA"));
        assertFalse(detectCapital.detectCapitalUse("FlaG"));
        assertTrue(detectCapital.detectCapitalUse("flag"));

    }
}