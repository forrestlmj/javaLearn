package com.github.yck.pattern.behavioral.softwarelike.memento.theory;

public class Client {
    public static void main(String[] args) {
        Originator o = new Originator("first");
        CareTaker careTaker = new CareTaker();
        careTaker.add(o.saveStateMemento());

        o.setState("second version");
        careTaker.add(o.saveStateMemento());

        o.setState("Third version");
        careTaker.add(o.saveStateMemento());

        o.getStateFromMemento(careTaker.get(1));
        System.out.println(o);

    }
}
