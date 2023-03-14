package com.github.yck.pattern.behavioral.statefulbehaivor.strategy.payway.strategy;

import java.util.List;

public class CreditCard implements PayStrategy {
    private String id;
    private String password;
    @Override
    public void askForDetailInfo() {
        System.out.println("请提供 身份证号码、密码");

    }

    @Override
    public void getDetailInfo(List<String> info) {
        id = info.get(0);password = info.get(1);
    }

    @Override
    public void pay() {
        System.out.println("信用卡号"+id+"已付款");

    }
}
