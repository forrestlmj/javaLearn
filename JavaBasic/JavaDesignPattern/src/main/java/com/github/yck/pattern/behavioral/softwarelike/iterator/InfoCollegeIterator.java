//package com.github.yck.pattern.behavioral.softwarelike.iterator;
//
//import java.util.ArrayList;
//import java.util.Iterator;
//import java.util.List;
//import java.util.Set;
//
//public class InfoCollegeIterator implements Iterator<Department> {
//    private List<Department> innerDataList;
//    private Integer pointer = 0;
//    public InfoCollegeIterator(Set<Department> s) {
//        innerDataList = new ArrayList<>();
//        innerDataList.addAll(s);
//    }
//
//    @Override
//    public boolean hasNext() {
//        return pointer < innerDataList.size();
//    }
//
//    @Override
//    public Department next() {
//        Department o = innerDataList.get(pointer);
//        pointer ++;
//        return o;
//    }
//}
