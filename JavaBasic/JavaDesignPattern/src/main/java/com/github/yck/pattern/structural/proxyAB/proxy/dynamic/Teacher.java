package com.github.yck.pattern.structural.proxyAB.proxy.dynamic;

public class Teacher implements ITeacher {
    @Override
    public void teach() {
        System.out.println("Teacher is teaching.");
    }

    @Override
    public void sayHello() {
        System.out.println("Teacher say hello.");
    }
}
