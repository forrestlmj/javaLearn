package com.github.yck.pattern.behavioral.statefulbehaivor.observer;

public class Sina implements Observer {
    private Float temperature;
    private String name;

    @Override
    public String toString() {
        return "Sina{" +
                "temperature=" + temperature +
                ", name='" + name + '\'' +
                '}';
    }

    public void setTemperature(Float temperature) {
        this.temperature = temperature;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Sina() {
        setName("Sina");
    }

    @Override
    public void fetch(Float temperature) {
        setTemperature(temperature);
        System.out.println(this);

    }
}
