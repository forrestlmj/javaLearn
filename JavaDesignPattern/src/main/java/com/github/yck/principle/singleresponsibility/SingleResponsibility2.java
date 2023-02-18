package com.github.yck.principle.singleresponsibility;

/**
 * Single Responsibility 单一职责
 * 拆分两个类，体现单一职责，一个类就做一个事情
 */
public class SingleResponsibility2 {
    public static void main(String[] args) {
        WaterVehicle wv = new WaterVehicle();
        wv.run("小船");
        AirplaneVehicle apv = new AirplaneVehicle();
        apv.run("波音 747 ");

    }
}

class WaterVehicle{
    public void run(String msg){
        System.out.println(msg+"跑在道上");
    }
}
class AirplaneVehicle{
    public void run(String msg){
        System.out.println(msg+"飞在航线");
    }

}