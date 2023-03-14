package com.github.yck.pattern.behavioral.statefulbehaivor.state.foodorder;

public class Client {
    private static final int MONEY = 33;
    public static void main(String[] args) throws InterruptedException {
        OrderContext orderContext = new OrderContext(MONEY);
        System.out.println("已充值:"+ MONEY);
        int i = 0;
        while (true){
            Thread.sleep(500);
            i++;
            System.out.println("-------第 "+(i)+" 次派单");
            if (orderContext.run()) {
                System.out.println("继续下单。");
            }else
            {
                System.out.println("退出下单");
                break;
            }

        }
    }
}
