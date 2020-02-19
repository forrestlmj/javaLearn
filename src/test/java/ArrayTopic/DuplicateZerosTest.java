package ArrayTopic;

import org.junit.Test;

import static org.junit.Assert.*;

public class DuplicateZerosTest {

    @Test
    public void duplicateZeros() {
        int[] re = {1,0,2,3,0,4,5,0};
        DuplicateZeros d= new DuplicateZeros();
        d.duplicateZeros(re);
    }
}