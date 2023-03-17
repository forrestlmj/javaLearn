package com.github.yck.pattern.structural.structural.facade;

public class HomeTheaterFacade {
    DVDPlayer d;
    PopCorn p;
    TV t;

    public HomeTheaterFacade() {
        d = new DVDPlayer();
        p = new PopCorn();
        t = new TV();
    }

    public void Ready(){
        d.On();d.setDVD();
        p.On();p.pop();
        t.On();
        System.out.println("--------- ----------");

    }

    public void Play(){
        t.CCTV();
        System.out.println("--------- ----------");

    }

    public void Close(){
        d.Close();
        p.Off();
        t.Off();
        System.out.println("--------- ----------");

    }
}
