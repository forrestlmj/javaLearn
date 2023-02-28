package com.github.yck.pattern.creational.prototype;

public class Sheep {
    private String name;
    private Integer id;
    private String color;

    public Sheep(String name, Integer id, String color) {
        this.name = name;
        this.id = id;
        this.color = color;
    }

    @Override
    public String toString() {
        return "Sheep{" +
                "name='" + name + '\'' +
                ", id=" + id +
                ", color='" + color + '\'' +
                '}';
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }
}
