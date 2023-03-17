package com.github.yck.pattern.structural.proxyAB.proxy.dynamic;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

public class ProxyFactory {
    Object proxyInstance;

    public ProxyFactory(Object proxyInstance) {
        this.proxyInstance = proxyInstance;
    }

    public Object getProxyInstance(){
        return Proxy.newProxyInstance(
                proxyInstance.getClass().getClassLoader(), proxyInstance.getClass().getInterfaces(), new InvocationHandler() {
                    @Override
                    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
                        System.out.println("Start Proxy");
                        Object returnVal = method.invoke(proxyInstance, args);
                        System.out.println("End Proxy");
                        return returnVal;
                    }
                }
        );
    }
}
