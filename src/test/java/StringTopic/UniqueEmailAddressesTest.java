package StringTopic;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class UniqueEmailAddressesTest {

    @Test
    void numUniqueEmails() {
        String [] s = {"test.email+alex@leetcode.com", "test.email@leetcode.com"};
        UniqueEmailAddresses uniqueEmailAddresses = new UniqueEmailAddresses();
        assertEquals(1,uniqueEmailAddresses.numUniqueEmails(s));
        String [] s2 = {"@leetcode.com","test.e.mail+bob.cathy@leetcode.com","testemail+david@lee.tcode.com"};
//        UniqueEmailAddresses uniqueEmailAddresses = new UniqueEmailAddresses();
        assertEquals(3,uniqueEmailAddresses.numUniqueEmails(s2));
        String [] s3 = {"@","@leetcode.com","test.e.mail+bob.cathy@leetcode.com","testemail+david@lee.tcode.com"};
        assertEquals(4,uniqueEmailAddresses.numUniqueEmails(s3));

    }
}