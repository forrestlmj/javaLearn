package com.github.yck.pattern.behavioral.softwarelike.iterator;

import java.util.Iterator;

public class Client {
    public static void main(String[] args) {
        Iterator<Department> iterator = new ComputerCollege().createIterator();
        Iterator<Department> iterator1 = new InfoCollege().createIterator();
        iterator.forEachRemaining(
                System.out::println
        );
        iterator1.forEachRemaining(
                System.out::println
        );
    }
}
