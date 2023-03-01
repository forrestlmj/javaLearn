package com.github.yck.pattern.structural.adapter.defaultadapter;

import org.apache.commons.lang.ArrayUtils;

import java.util.ArrayList;
import java.util.List;

public class Client {
    public static void main(String[] args) {
        System.out.println(new AllDefaultMethod() {
            @Override
            public String add2(String a, String b) {
                return a + b;
            }
        }.add2("yck", "wsn"));

        System.out.println(new AllDefaultMethod() {
            @Override
            public List<String> add3(List<String> o, List<String> o2) {
                o2.forEach(element -> o.add(element));
                return o;
            }
        }.add3(new ArrayList<String>() {{
                   add("yck");
               }},
                new ArrayList<String>() {{
                    add("wsn");
                }}));
    }
}
