package com.github.yck.pattern.structural.proxyAB.proxy.staticproxy;

public class TeacherProxy implements ITeacher {
    private Teacher t;

    public TeacherProxy(Teacher t) {
        this.t = t;
    }

    @Override
    public void teach() {
        System.out.println("Start Proxy");
        t.teach();
        System.out.println("End Proxy");
    }
}
