package com.atguigu.spring5;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：10/14/20 1:37 PM
 */


public class Orders {
    private String oname = "";
    private String address;

    public Orders(String oname, String address){
        this.oname = oname;
        this.address = address;
    }

    public void ordersTest(){
        System.out.println(oname+"::"+address);
    }
}
