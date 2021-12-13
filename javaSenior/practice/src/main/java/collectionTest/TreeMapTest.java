package collectionTest;

import org.junit.Test;

import java.util.Map;
import java.util.TreeMap;

public class TreeMapTest {
    @Test
    public void test(){
        Map<Student,String> noteForStudent = new TreeMap<>();
        noteForStudent.put(new Student("tom",95),"A");
        noteForStudent.put(new Student("jerry",88),"B");
        noteForStudent.put(new Student("rose",100),"A");
        noteForStudent.put(new Student("jack",100),"A+");

        for (Student student : noteForStudent.keySet()) {
            System.out.println(student);
        }
    }
}
class Student implements Comparable<Student>{
    @Override
    public String toString() {
        return "Student{" +
                "name='" + name + '\'' +
                ", score=" + score +
                '}';
    }

    public Student(String name, Integer score) {
        this.name = name;
        this.score = score;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    private String name;
    private Integer score;
    @Override
    public int compareTo(Student o) {
        int compare = Integer.compare(this.score, o.score);
        if(compare == 0){
            return this.getName().compareTo(o.getName());
        }else return compare;
    }
}
