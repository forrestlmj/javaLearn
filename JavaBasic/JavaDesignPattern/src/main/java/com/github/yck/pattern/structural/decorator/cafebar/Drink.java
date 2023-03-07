package com.github.yck.pattern.structural.decorator.cafebar;

abstract public class Drink {
    public abstract float cost();

    @Override
    public String toString() {
        return "Drink{" +
                "description='" + description + '\'' +
                ", prize=" + prize +
                '}';
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    private String description;

    public float getPrize() {
        return prize;
    }

    public void setPrize(float prize) {
        this.prize = prize;
    }

    private float prize;
}
