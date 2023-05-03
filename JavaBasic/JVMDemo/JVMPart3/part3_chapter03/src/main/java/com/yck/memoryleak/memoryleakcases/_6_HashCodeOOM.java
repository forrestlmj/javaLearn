package com.yck.memoryleak.memoryleakcases;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

/**
 *   作为 HashMap 的 Key 的 POJO 对象，即使重写了 hashcode 和 equal 方法，如果改变值
 *   也会发生删除失败，添加失败的问题，导致内存泄露
 */
@Deprecated
public class _6_HashCodeOOM {
    public static void main(String[] args) {
        Map<Student,String> m = new HashMap<>();
        Student yck = new Student("yck", "985");
        Student xjp = new Student("xjp", "211");
        m.put(yck,"Beijing Institute of Technology");
        m.put(xjp,"NIT");
        m.put(new Student("mzd","985"),"NIT");

        System.out.println(m);
        // 这里改为另一个值，会内存泄漏。
        yck.setName("yck son");
        m.put(yck,"New");
        System.out.println(m);

        xjp.setName("xjp zbc");
        System.out.println(m);

    }
}

class Student{
    public Student(String name, String id) {
        this.name = name;
        this.id = id;
    }

    private String name;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Student student = (Student) o;

        if (!Objects.equals(name, student.name)) return false;
        return Objects.equals(id, student.id);
    }

    @Override
    public int hashCode() {
        int result = name != null ? name.hashCode() : 0;
        result = 31 * result + (id != null ? id.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "Student{" +
                "name='" + name + '\'' +
                ", id='" + id + '\'' +
                '}';
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    private String id;
}
