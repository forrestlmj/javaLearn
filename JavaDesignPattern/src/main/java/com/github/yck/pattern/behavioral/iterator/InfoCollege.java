package com.github.yck.pattern.behavioral.iterator;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class InfoCollege implements College {
    public InfoCollege() {
        l.add(new Department("电器"));
        l.add(new Department("电子"));

    }

    Set<Department> l = new HashSet<>();
    @Override
    public Iterator<Department> createIterator() {
        return new InfoCollegeIterator(l);
    }

}
