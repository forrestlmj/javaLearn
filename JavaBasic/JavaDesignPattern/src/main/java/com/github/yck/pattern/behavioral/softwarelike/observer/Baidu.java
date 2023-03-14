package com.github.yck.pattern.behavioral.softwarelike.observer;

public class Baidu implements Observer {
    private Float temperature;
    private String name;

    public void setTemperature(Float temperature) {
        this.temperature = temperature;
    }

    @Override
    public String toString() {
        return "Baidu{" +
                "temperature=" + temperature +
                ", name='" + name + '\'' +
                '}';
    }

    public void setName(String name) {
        this.name = name;
    }

    public Baidu() {
        name = "Baidu";
    }

    @Override
    public void fetch(Float temperature) {
        setTemperature(temperature);
        System.out.println(this);
    }
}
