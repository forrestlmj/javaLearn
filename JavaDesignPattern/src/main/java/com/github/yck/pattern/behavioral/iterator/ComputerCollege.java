package com.github.yck.pattern.behavioral.iterator;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * 内部用List
 */
public class ComputerCollege implements College {
    List<Department> l = new ArrayList<>();

    public ComputerCollege() {
        l.add(new Department("物联网"));
        l.add(new Department("计算机"));
        l.add(new Department("软件工程"));
        l.add(new Department("数据科学"));
    }

    @Override
    public Iterator<Department> createIterator() {
        return new ComputerCollegeIterator(this.l);
    }

}
