import org.junit.Test;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

interface Human{
    void getBelief();
    void eat(String food);
}
class HumanUtil{
    public static void wakeup(){
        System.out.println("---------------");
        System.out.println("Everybody wake up on morning.");
    }
    public static void sleep(){
        System.out.println("Everybody go to sleep on night.");
        System.out.println("---------------");

    }
}
class BatMan implements Human{

    @Override
    public void getBelief() {
        System.out.println("My name is "+BatMan.class.getName()+".And I like dark night.");
    }

    @Override
    public void eat(String food) {
        System.out.println(BatMan.class.getName()+" like "+food+" .");
    }
}
class SuperMan implements Human{
//    private String name;
//
//    public SuperMan(String name) {
//        this.name = name;
//    }

    @Override
    public void getBelief() {
        System.out.println("I have a dream and I am " + SuperMan.class.getName());
    }

    @Override
    public void eat(String food) {
        System.out.println("I like eat " + food + ".");
    }
}

/**
 * 要想实现动态代理，需要解决的问题？
 * 问题一：如何根据加载到内存中的被代理类，动态的创建一个代理类及其对象。
 * 问题二：当通过代理类的对象调用方法a时，如何动态的去调用被代理类中的同名方法a。
 */
class ProxyFactory{
    //调用此方法，返回一个代理类的对象。解决问题一
    public static Object getProxyInstance(Object obj){
        MyInvocationHandler myInvocationHandler = new MyInvocationHandler(obj);
        return Proxy.newProxyInstance(obj.getClass().getClassLoader(), obj.getClass().getInterfaces(),myInvocationHandler);
    }
}
class MyInvocationHandler implements InvocationHandler{
    private Object obj;//需要使用被代理类的对象进行赋值

    public MyInvocationHandler(Object obj) {
        this.obj = obj;
    }

    //当我们通过代理类的对象，调用方法a时，就会自动的调用如下的方法：invoke()
    //将被代理类要执行的方法a的功能就声明在invoke()中
    @Override
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
        HumanUtil.wakeup();
        Object value = method.invoke(obj, args);
        HumanUtil.sleep();
        return value;
    }

}
public class ProxyTest {
    @Test
    public void testSuperman() {
        SuperMan superMan = new SuperMan();
        Human proxyInstance = (Human)ProxyFactory.getProxyInstance(superMan);
        proxyInstance.getBelief();

        proxyInstance.eat("noodle");
    }
    @Test
    public void testBatman(){
        BatMan batMan = new BatMan();
        Human proxyInstance = (Human)ProxyFactory.getProxyInstance(batMan);
        proxyInstance.getBelief();
    }
    public static void main(String[] args) {

    }
}
