package com.atguigu;

import org.junit.Test;

import java.util.List;
import java.util.Map;

/** 如何自定义泛型结构：泛型类、泛型接口；泛型方法。
 *
 * 1. 关于自定义泛型类、泛型接口：
 *
 *
 *
 * @author shkstart
 * @create 2019 上午 11:09
 */
public class GenericTest1 {
    @Test
    public void test(){
        //如果定义了泛型类，实例化没有指明类的泛型，则认为此泛型类型为Object类型
        //要求：如果大家定义了类是带泛型的，建议在实例化时要指明类的泛型。
        Order<String> stringOrder = new Order<String>("order",1,
                "Order content.");
        String[] a = {"sdf","sdfs","sfs"};
        List<String> strings = Order.copyFromArrayToList(a);
        System.out.println(strings);
    }

    @Test
    public void test2(){
        String[] k = {"abc","sdfs","yck","sdf"};
        Integer[] v = {1,2,3,4};
        Map<String, Integer> stringIntegerMap = MyUtil.fromListToMap(
                MyUtil.fromArrayToList(k),
                MyUtil.fromArrayToList(v)
        );
        stringIntegerMap.forEach((s, integer) -> System.out.println(s+"->"+integer));
        String[] duArray = {"c","c","s"};
        System.out.println(MyUtil.fromListToSet(MyUtil.fromArrayToList(duArray)));
    }
    @Test
    public void test3(){
        Order<String> order1 = new Order<>("sdf1", 1, "cont1");
        Order<String> order2 = new Order<>("sdf2", 1, "cont2");
        SubOrder<String> orderList = new SubOrder<>();
        orderList.makeSubList(order1.getOrderName());
        List<String> strings = orderList.makeSubList(order2.getOrderName());
        strings.forEach((t) -> System.out.println(t));
    }
}
