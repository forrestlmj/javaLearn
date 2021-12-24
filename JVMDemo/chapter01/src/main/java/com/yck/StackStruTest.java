package com.yck;

/**
 *
 *
 */
public class StackStruTest {
    public static void main(String[] args) throws InterruptedException {
        int i = 2;
        char s = 's';
        String a = "abcsss";
        int j = 3;
        int k = i + j;

        Thread.sleep(1000);

        System.out.println(a);
    }
}
class Person{
    String name;
    String gender;

    public Person(String name) {
        this.name = name;
    }

    public Person(String name, String gender) {
        this.name = name;
        this.gender = gender;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}