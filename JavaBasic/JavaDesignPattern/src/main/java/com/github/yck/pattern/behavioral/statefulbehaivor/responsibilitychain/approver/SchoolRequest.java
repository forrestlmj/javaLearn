package com.github.yck.pattern.behavioral.statefulbehaivor.responsibilitychain.approver;

public class SchoolRequest {
    String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getMoney() {
        return money;
    }

    public void setMoney(Integer money) {
        this.money = money;
    }

    @Override
    public String toString() {
        return "SchoolRequest{" +
                "name='" + name + '\'' +
                ", money=" + money +
                '}';
    }

    Integer money;

    public SchoolRequest(String name, Integer money) {
        this.name = name;
        this.money = money;
    }
}
