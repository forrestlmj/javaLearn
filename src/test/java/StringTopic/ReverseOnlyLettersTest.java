package StringTopic;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class ReverseOnlyLettersTest {

    @Test
    void reverseOnlyLetters() {
        Character c = 'c';

        System.out.println((int) c);
        ReverseOnlyLetters reverseOnlyLetters = new ReverseOnlyLetters();
        assertEquals("dc-ba",reverseOnlyLetters.reverseOnlyLetters("ab-cd"));
        assertEquals("j-Ih-gfE-dCba",reverseOnlyLetters.reverseOnlyLetters("a-bC-dEf-ghIj"));
        assertEquals("Qedo1ct-eeLg=ntse-T!",reverseOnlyLetters.reverseOnlyLetters("Test1ng-Leet=code-Q!"));
        assertEquals("Qedo1ct-eeLg=ntse-T!12",reverseOnlyLetters.reverseOnlyLetters("Test1ng-Leet=code-Q!12"));
//        assertEquals("Qedo1ct-eeLg=ntse-T!Q1",reverseOnlyLetters.reverseOnlyLetters("Test1ng-Leet=code-Q!"));


    }
}