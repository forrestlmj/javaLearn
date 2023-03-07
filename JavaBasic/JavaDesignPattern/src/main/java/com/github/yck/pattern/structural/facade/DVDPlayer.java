package com.github.yck.pattern.structural.facade;

public class DVDPlayer {
    private static DVDPlayer d = new DVDPlayer();
    public void On(){
        System.out.println("DVDPlayer is on.");
    }

    public void Close(){
        System.out.println("DVDPlayer is Close.");
    }

    public void setDVD(){
        System.out.println("DVDPlayer is set.");
    }

    private DVDPlayer(){}

    public static DVDPlayer getD() {
        return d;
    }
}
