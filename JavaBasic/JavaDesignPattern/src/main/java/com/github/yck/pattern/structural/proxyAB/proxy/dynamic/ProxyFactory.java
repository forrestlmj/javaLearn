package com.github.yck.pattern.structural.proxyAB.proxy.dynamic;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

public class ProxyFactory {
    Object o;

    public ProxyFactory(Object o) {
        this.o = o;
    }

    public Object getProxyInstance(){
        return Proxy.newProxyInstance(
                o.getClass().getClassLoader(), o.getClass().getInterfaces(), new InvocationHandler() {
                    @Override
                    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
                        System.out.println("Start Proxy");
                        Object returnVal = method.invoke(o, args);
                        System.out.println("End Proxy");
                        return returnVal;
                    }
                }
        );
    }
}
