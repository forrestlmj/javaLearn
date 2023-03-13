package com.github.yck.pattern.behavioral.softwarelike.memento.theory;

public class Originator {
    private String state;

    @Override
    public String toString() {
        return "Originator{" +
                "state='" + state + '\'' +
                '}';
    }

    public Originator(String state) {
        this.state = state;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
    public Memento saveStateMemento(){
        return new Memento(state);
    }

    public void getStateFromMemento(Memento m){
        setState(m.getState());
    }
}
