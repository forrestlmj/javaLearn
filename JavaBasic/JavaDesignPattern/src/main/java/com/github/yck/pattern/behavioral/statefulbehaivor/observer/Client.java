package com.github.yck.pattern.behavioral.statefulbehaivor.observer;

public class Client {
    public static void main(String[] args) {
        WeatherData w = new WeatherData();
        w.register(new Baidu());
        w.setTempInCity((float) 10L);
        w.register(new Sina());
        w.setTempInCity((float) 15L);
        w.setTempInCity((float) 15.5);
    }
}
