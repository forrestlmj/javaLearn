package com.github.yck.uml.generalization;

public class Generalization {
    public static void main(String[] args) {

    }
}

abstract class SupportDao{
    void save(Object o){}
    void delete(Object o){}
}

class PersonServiceBean extends SupportDao{}
