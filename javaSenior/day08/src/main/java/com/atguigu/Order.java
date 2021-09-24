package com.atguigu;

import java.util.ArrayList;
import java.util.List;

public class Order<T> {
    private String orderName;
    private Integer orderId;

    public Order() {
    }

    private T orderT;

    public String getOrderName() {
        return orderName;
    }

    public Order(String orderName, Integer orderId, T orderT) {
        this.orderName = orderName;
        this.orderId = orderId;
        this.orderT = orderT;
    }

    public void setOrderName(String orderName) {
        this.orderName = orderName;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public T getOrderT() {
        return orderT;
    }

    public void setOrderT(T orderT) {
        this.orderT = orderT;
    }
    //泛型方法：在方法中出现了泛型的结构，泛型参数与类的泛型参数没有任何关系。
    //换句话说，泛型方法所属的类是不是泛型类都没有关系。
    //泛型方法，可以声明为静态的。原因：泛型参数是在调用方法时确定的。并非在实例化类时确定。

    public static <T> List<T> copyFromArrayToList(T[] arr){
        ArrayList<T> ts = new ArrayList<>();
        for (T t : arr) {
            ts.add(t);
        }
        return ts;
    }

}
