package collectionTest;

import org.junit.Test;

import java.util.Map;
import java.util.TreeMap;

public class TreeMapTest {
    @Test
    public void test(){
        Map<Student,String> noteForStudent = new TreeMap<>();

    }
}
class Student implements Comparable<Student>{


    @Override
    public int compareTo(Student o) {
        return 0;
    }
}
