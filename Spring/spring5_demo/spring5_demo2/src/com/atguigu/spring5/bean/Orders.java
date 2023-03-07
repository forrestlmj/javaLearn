package com.atguigu.spring5.bean;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：10/14/20 4:50 PM
 */


public class Orders {
    private String oname;

    public void setOname(String oname) {
        this.oname = oname;
        System.out.println("第二步 调用set方法设置属性值");
    }

    public Orders( ) {
        System.out.println("第一步 执行无参构建创建bean实例");
    }

    public void initMethod(){
        System.out.println("第三步 执行初始化的方法");
    }

    public void destroyMethod(){
        System.out.println("第五步 执行销毁方法");
    }
}
