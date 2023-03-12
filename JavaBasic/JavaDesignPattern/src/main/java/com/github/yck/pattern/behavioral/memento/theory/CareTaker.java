package com.github.yck.pattern.behavioral.memento.theory;

import java.util.ArrayList;
import java.util.List;

public class CareTaker {
    private List<Memento> list = new ArrayList<>();
    public void add(Memento m){
        list.add(m);
    }

    public Memento get(Integer idx){
        return list.get(idx);
    }
}
