//package com.github.yck.pattern.behavioral.softwarelike.iterator;
//
//import java.util.HashSet;
//import java.util.Iterator;
//import java.util.Set;
//
//public class InfoCollege implements College {
//    public InfoCollege() {
//        innerDataSet.add(new Department("电器"));
//        innerDataSet.add(new Department("电子"));
//
//    }
//
//    Set<Department> innerDataSet = new HashSet<>();
//    @Override
//    public Iterator<Department> createIterator() {
//        return new InfoCollegeIterator(innerDataSet);
//    }
//
//}
