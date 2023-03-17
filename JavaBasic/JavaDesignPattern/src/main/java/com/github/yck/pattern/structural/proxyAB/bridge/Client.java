package com.github.yck.pattern.structural.proxyAB.bridge;

public class Client {
    public static void main(String[] args) {
        FoldedPhone foldedPhone = new FoldedPhone(new HuaWei());
        foldedPhone.call();

        UpRightPhone upRightPhone = new UpRightPhone(new Xiaomi());
        upRightPhone.call();
    }
}
