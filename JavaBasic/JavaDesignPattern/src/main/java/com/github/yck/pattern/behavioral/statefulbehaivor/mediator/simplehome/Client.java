package com.github.yck.pattern.behavioral.statefulbehaivor.mediator.simplehome;

public class Client {
    public static void main(String[] args) throws InterruptedException {
        HomeCenter h = new HomeCenter();
        while (true){
            h.process(HomeCenter._COFFEE);
            h.process(HomeCenter._RADIO);

        }
    }
}
