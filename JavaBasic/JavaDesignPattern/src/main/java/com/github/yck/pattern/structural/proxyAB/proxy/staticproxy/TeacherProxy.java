package com.github.yck.pattern.structural.proxyAB.proxy.staticproxy;

public class TeacherProxy implements ITeacher {
    private Teacher teacher;

    public TeacherProxy(Teacher teacher) {
        this.teacher = teacher;
    }

    @Override
    public void teach() {
        System.out.println("Start Proxy");
        teacher.teach();
        System.out.println("End Proxy");
    }
}
