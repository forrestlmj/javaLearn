package com.atguigu;

import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

public class Generic2Test {
    @Test
    public void test(){
        List<? super Person> s = new ArrayList<>();
        s.add(new Student2());


    }
}
