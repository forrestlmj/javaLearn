package com.github.yck.pattern.behavioral.softwarelike.iterator;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * 内部用List
 */
public class ComputerCollege implements College {
    List<Department> innerDataList = new ArrayList<>();

    public ComputerCollege() {
        innerDataList.add(new Department("物联网"));
        innerDataList.add(new Department("计算机"));
        innerDataList.add(new Department("软件工程"));
        innerDataList.add(new Department("数据科学"));
    }

    @Override
    public Iterator<Department> createIterator() {
        return new ComputerCollegeIterator(this.innerDataList);
    }

}
