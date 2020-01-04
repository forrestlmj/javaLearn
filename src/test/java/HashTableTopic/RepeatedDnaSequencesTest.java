package HashTableTopic;

import org.junit.Test;

import static org.junit.Assert.*;

public class RepeatedDnaSequencesTest {

    @Test
    public void findRepeatedDnaSequences() {
        /**
         * 时间复杂度肯定为O(N)
         * 空间复杂度集合解法为O(N)，除非能想到HASH方法简化值
         * 字典树解法为O(1)
         */
        String s = "AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT";
        RepeatedDnaSequences r = new RepeatedDnaSequences();
        r.findRepeatedDnaSequences(s);
        r.findRepeatedDnaSequences("AA");
        r.findRepeatedDnaSequences("AAAAACCCCC");
        r.findRepeatedDnaSequences("AAAAACCCCCA");
        r.findRepeatedDnaSequences("AAAAAAAAAAA");

    }
}