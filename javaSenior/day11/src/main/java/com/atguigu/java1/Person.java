package com.atguigu.java1;
@MyAnnotation(value = "hi")
public class Person extends Creature<String> implements MyInterface,Comparable<String>{
    @MyAnnotation(value = "this is A name")
    private String name;
    int age;
    public int id;

    public Person() {
    }
    @MyAnnotation(value = "abc")
    public Person(String name, int age, int id) {
        this.name = name;
        this.age = age;
        this.id = id;
    }
    @MyAnnotation(value = "this is private")
    private String show(String nation){
        System.out.println(nation);
        return nation;
    }
    public String display(String interests,int age) throws NullPointerException,ClassCastException{
        return interests + age;
    }
    @Override
    public String toString() {
        return "Person{" +
                "name='" + name + '\'' +
                ", age=" + age +
                ", id=" + id +
                '}';
    }

    @Override
    public void info() {
        System.out.println("我是一个人");
    }
    private static void showDesc(){
        System.out.println("我是一个可爱的人");
    }

    @Override
    public int compareTo(String o) {
        return 0;
    }
}
