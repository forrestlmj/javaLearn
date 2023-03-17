package com.github.yck.pattern.structural.structural.facade;

public class HomeTheaterFacade {
    DVDPlayer d;
    PopCorn p;
    Screen s;
    TV t;

    public HomeTheaterFacade() {
        d = DVDPlayer.getD();
        p = PopCorn.getP();
        s = Screen.getS();
        t = TV.getT();
    }

    public void Ready(){
        d.On();d.setDVD();
        p.On();p.pop();
        s.Up();
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
        s.Down();
        t.Off();
        System.out.println("--------- ----------");

    }
}
