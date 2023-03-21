package com.github.yck.pattern.behavioral.statefulbehaivor.mediator.simplehome;

import java.util.HashMap;
import java.util.Map;

public class HomeCenter implements Mediator {
    public static final String _COFFEE = "COFFEE";

    public static final String _RADIO = "RADIO";
    public HomeCenter() {

        new Coffee(_COFFEE,this);
        new Radio(_RADIO,this);
    }

    private Map<String, Thing> m = new HashMap<>();


    @Override
    public void getMessage(String s)  {
        System.out.println("Get Call Back from "+s);

    }

    @Override
    public void process(String type) {
        switch (type){
            case _COFFEE:
                Thing thing1 = m.get(_COFFEE);
                thing1.execute();
                break;
            case _RADIO:
                Thing thing2 = m.get(_RADIO);
                thing2.execute();break;
            default:break;
        }
    }

    @Override
    public void register(String name, Thing t) {
        m.put(name, t);
    }
}
