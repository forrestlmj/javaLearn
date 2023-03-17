package com.github.yck.pattern.structural.proxyAB.proxy.staticproxy;

public class Teacher implements ITeacher {
    @Override
    public void teach() {
        System.out.println("Teacher is teaching ...");
    }
}
