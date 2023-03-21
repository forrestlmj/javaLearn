package com.github.yck.pattern.behavioral.statefulbehaivor.state.simplefoodorder;


import com.github.yck.pattern.behavioral.statefulbehaivor.state.simplefoodorder.state.OrderContext;

public class Client {
    public static void main(String[] args) throws InterruptedException {
        OrderContext or = new OrderContext();
        or.handle();
    }
}
