package StringTopic;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class ReverseOnlyLettersTest {

    @Test
    void reverseOnlyLetters() {
        Character c = 'c';

        ReverseOnlyLetters reverseOnlyLetters = new ReverseOnlyLetters();
        assertEquals("dc-ba",reverseOnlyLetters.reverseOnlyLetters("ab-cd"));
//        assertEquals("j-Ih-gfE-dCba",reverseOnlyLetters.reverseOnlyLetters("a-bC-dEf-ghIj"));
        assertEquals("Qedo1ct-eeLg=ntse-T!",reverseOnlyLetters.reverseOnlyLetters("Test1ng-Leet=code-Q!"));


    }
}