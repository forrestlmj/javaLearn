package com.github.yck.pattern.behavioral.iterator;

import java.util.Iterator;
import java.util.List;

public class ComputerCollegeIterator implements Iterator<Department> {
    public ComputerCollegeIterator(List<Department> l) {
        this.l = l;
    }

    private List<Department> l;
    private Integer index = 0;

    @Override
    public boolean hasNext() {
        return index < l.size();
    }

    @Override
    public Department next() {
        Department d = l.get(index);
        index ++;
        return d;
    }
}
