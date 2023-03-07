package com.github.yck.pattern.behavioral.observer;

import java.util.ArrayList;
import java.util.List;

public class WeatherData implements Subject {
    public Float getTempInCity() {
        return tempInCity;
    }

    public void setTempInCity(Float tempInCity) {
        this.tempInCity = tempInCity;
        notifyAllRegister();
    }

    Float tempInCity;
    List<Observer> observers = new ArrayList<>();
    @Override
    public void register(Observer o) {
        observers.add(o);
    }

    @Override
    public void remove(Observer o) {
        observers.remove(o);
    }

    @Override
    public void notifyAllRegister() {
        observers.forEach(o -> {
            o.fetch(getTempInCity());
        });
    }
}
