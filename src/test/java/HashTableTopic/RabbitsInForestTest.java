package HashTableTopic;

import StringTopic.RansomNote;
import org.junit.Test;

import static org.junit.Assert.*;

public class RabbitsInForestTest {

    @Test
    public void numRabbits() {
        RabbitsInForest r = new RabbitsInForest();
        int [] a= {1, 1, 2};
        System.out.println(r.numRabbits(a));
        int [] b= {10, 10, 10};
        System.out.println(r.numRabbits(b));
        int [] c= {};
        System.out.println(r.numRabbits(c));
        int [] d = {1,0,1,0,0};
        System.out.println(r.numRabbits(d));
        int [] e = {0,0,0,0,0,0,0,111};
        System.out.println(r.numRabbits(e));

    }
}