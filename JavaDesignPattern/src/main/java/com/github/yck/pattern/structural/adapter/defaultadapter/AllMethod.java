package com.github.yck.pattern.structural.adapter.defaultadapter;

import java.util.List;
import java.util.Set;

public interface AllMethod {
    Integer add1(Integer a, Integer b);
    String add2(String a, String b);
    List<String> add3(List<String> o, List<String> o2);
    Set<String> add4(Set<String> o, Set<String> o2);
}
