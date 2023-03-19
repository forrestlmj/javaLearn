package com.github.yck.pattern.behavioral.softwarelike.iterator;

import java.util.Iterator;
import java.util.List;

public class ComputerCollegeIterator implements Iterator<Department> {
    public ComputerCollegeIterator(List<Department> innerDataList) {
        this.innerDataList = innerDataList;
    }

    private List<Department> innerDataList;
    private Integer pointer = 0;

    @Override
    public boolean hasNext() {
        return pointer < innerDataList.size();
    }

    @Override
    public Department next() {
        Department d = innerDataList.get(pointer);
        pointer ++;
        return d;
    }
}
