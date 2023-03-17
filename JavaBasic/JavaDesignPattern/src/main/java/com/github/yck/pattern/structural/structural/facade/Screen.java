package com.github.yck.pattern.structural.structural.facade;

public class Screen {
    private static Screen s = new Screen();
    private Screen(){}

    public static Screen getS() {
        return s;
    }

    public void Up(){
        System.out.println("Screen is Up.");
    }

    public void Down(){
        System.out.println("Screen is Down.");
    }


}
