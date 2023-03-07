package com.github.yck.principle.dependencyInvision.improve;

import com.sun.org.apache.xerces.internal.dom.DeepNodeListImpl;

public class DependencyInvision2 {
    public static void main(String[] args) {
        Person p = new Person();
        p.receive(new Email());
        p.receive(new Wechat());
    }
}

interface Device{String getInfo();}

class Email implements Device{
    @Override
    public String getInfo() {
        return "This message is from Email";
    }
}

class Wechat implements Device{

    @Override
    public String getInfo() {
        return "This message is from Wechat";
    }
}

class Person{
    void receive(Device d){
        System.out.println(d.getInfo());
    }
}