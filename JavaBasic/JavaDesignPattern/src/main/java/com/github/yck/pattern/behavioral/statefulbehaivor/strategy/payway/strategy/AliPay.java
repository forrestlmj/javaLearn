package com.github.yck.pattern.behavioral.statefulbehaivor.strategy.payway.strategy;

import java.util.List;

public class AliPay implements PayStrategy {
    private String id;
    private String password;

    public AliPay() {
    }

    @Override
    public void askForDetailInfo() {
        System.out.println("请提供 支付宝id、密码");
    }

    @Override
    public void getDetailInfo(List<String> info) {
        id = info.get(0);password = info.get(1);
    }


    @Override
    public void pay() {
        System.out.println("支付宝id"+id+"已付款");

    }
}
