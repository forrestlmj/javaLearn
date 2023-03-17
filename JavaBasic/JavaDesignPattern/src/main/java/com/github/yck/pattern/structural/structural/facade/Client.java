package com.github.yck.pattern.structural.structural.facade;

public class Client {
    public static void main(String[] args) {
        HomeTheaterFacade htf = new HomeTheaterFacade();
        htf.Ready();
        htf.Play();
        htf.Close();
    }
}
