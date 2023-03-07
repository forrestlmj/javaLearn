package com.github.yck.pattern.behavioral.mediator.home;

import java.util.HashMap;
import java.util.Map;

public class HomeCenter implements Mediator {
    private static final String _COFFEE = "COFFEE";
    private static final String _CLOCK = "CLOCK";
    private static final String _TV = "TV";
    private static final String _RADIO = "RADIO";
    public HomeCenter() {

        new Clock(_CLOCK,this);
        new Coffee(_COFFEE,this);
        new Tv(_TV,this);
        new Radio(_RADIO,this);
    }

    private Map<String, Thing> m = new HashMap<>();


    @Override
    public void getMessage(STATES s) {
        System.out.println("Get Call Back from "+s);
        switch (s){
            case SHOULD_WAKE_UP:{
                m.get(_CLOCK).execute();
            }break;
            case CLOCK_DONE:{
                m.get(_COFFEE).execute();

            }break;
            case COFFEE_DONE:{
                m.get(_TV).execute();
                m.get(_RADIO).execute();

            }break;
            case TV_DONE:{}
            case RADIO_DONE:{}
            break;
            default:break;
        }
    }

    @Override
    public void register(String name, Thing t) {
        m.put(name, t);
    }
}
