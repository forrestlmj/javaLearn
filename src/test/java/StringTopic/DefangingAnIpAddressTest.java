package StringTopic;

import org.junit.Before;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class DefangingAnIpAddressTest {
    DefangingAnIpAddress defangingAnIpAddress = new DefangingAnIpAddress();
    @Test
    void defangIPaddr() {
        assertEquals("1[.]1[.]1[.]1",defangingAnIpAddress.defangIPaddr("1.1.1.1"));
    }
}