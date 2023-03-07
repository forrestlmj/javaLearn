package com.github.yck.uml.implementation;

public class Implementation {
    public static void main(String[] args) {
        PersonService personService = new PersonServiceBean();
        personService.delete(1);
    }
}

interface PersonService{
    void delete(Integer id);
}

class PersonServiceBean implements PersonService{

    @Override
    public void delete(Integer id) {
        System.out.println("Id: " + id + "is deleted. ");
    }
}
