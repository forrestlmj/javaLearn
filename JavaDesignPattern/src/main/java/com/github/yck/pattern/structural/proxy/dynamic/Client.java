package com.github.yck.pattern.structural.proxy.dynamic;

public class Client {
    public static void main(String[] args) {
        Teacher t = new Teacher();
        ProxyFactory proxyFactory = new ProxyFactory(t);
        ITeacher instance = (ITeacher)proxyFactory.getProxyInstance();
        instance.sayHello();
        instance.teach();
        System.out.println(t.getClass());
        // 类是Proxy
        System.out.println(instance.getClass());
    }
}
