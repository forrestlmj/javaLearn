package com.github.yck.pattern.behavioral.iterator;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

public class InfoCollegeIterator implements Iterator<Department> {
    private List<Department> d;
    private Integer index = 0;
    public InfoCollegeIterator(Set<Department> s) {
        d = new ArrayList<>();
        d.addAll(s);
    }

    @Override
    public boolean hasNext() {
        return index < d.size();
    }

    @Override
    public Department next() {
        Department o = d.get(index);
        index ++;
        return o;
    }
}
