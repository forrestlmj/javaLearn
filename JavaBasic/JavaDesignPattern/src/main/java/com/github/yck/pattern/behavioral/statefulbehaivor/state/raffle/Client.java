package com.github.yck.pattern.behavioral.statefulbehaivor.state.raffle;

import java.util.concurrent.ThreadPoolExecutor;

public class Client {
    public static void main(String[] args) throws InterruptedException {
        RaffleActivity activity = new RaffleActivity(1);

        for (int i = 0; i < 30; i++) {
            Thread.sleep(50);
            System.out.println("---------Round " + i +  " ----------");
            activity.debuctMoney();
            activity.raffle();
        }
    }
}
