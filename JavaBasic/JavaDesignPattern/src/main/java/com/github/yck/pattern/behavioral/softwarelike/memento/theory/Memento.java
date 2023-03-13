package com.github.yck.pattern.behavioral.softwarelike.memento.theory;

public class Memento {
    @Override
    public String toString() {
        return "Memento{" +
                "state='" + state + '\'' +
                '}';
    }

    private String state;

    public Memento(String state) {
        this.state = state;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
}
