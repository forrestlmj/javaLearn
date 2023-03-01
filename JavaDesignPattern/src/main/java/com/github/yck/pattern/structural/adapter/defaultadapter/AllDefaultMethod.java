package com.github.yck.pattern.structural.adapter.defaultadapter;

import java.util.List;
import java.util.Set;

public class AllDefaultMethod implements AllMethod {

    @Override
    public Integer add1(Integer a, Integer b) {
        return null;
    }

    @Override
    public String add2(String a, String b) {
        return null;
    }

    @Override
    public List<String> add3(List<String> o, List<String> o2) {
        return null;
    }

    @Override
    public Set<String> add4(Set<String> o, Set<String> o2) {
        return null;
    }
}
