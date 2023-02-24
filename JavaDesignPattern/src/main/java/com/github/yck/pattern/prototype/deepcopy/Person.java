package com.github.yck.pattern.prototype.deepcopy;

import java.io.Serializable;

public class Person implements Cloneable, Serializable {
    private String name;
    private Integer age;
    private char sex;
    private Address address;
    private int[] IdentityNumber;
    private static final long serialVersionUID = 1L;

    public Person(String name, Integer age, char sex, Address address, int[] identityNumber) {
        this.name = name;
        this.age = age;
        this.sex = sex;
        this.address = address;
        IdentityNumber = identityNumber;
    }



    @Override
    public Object clone() throws CloneNotSupportedException {
        return (Person) DeepCopyUtil.deepClone(this);
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public char getSex() {
        return sex;
    }

    public void setSex(char sex) {
        this.sex = sex;
    }

    public int[] getIdentityNumber() {
        return IdentityNumber;
    }

    public void setIdentityNumber(int[] identityNumber) {
        IdentityNumber = identityNumber;
    }

    @Override
    public String toString() {
        return "Person{" +
                "name='" + name + '\'' +
                ", address=" + address +
                '}';
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }
}
