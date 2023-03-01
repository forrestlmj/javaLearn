package com.github.yck.pattern.structural.bridge;

public class Client {
    public static void main(String[] args) {
        FoldedPhone foldedPhone = new FoldedPhone(new HuaWei());
        foldedPhone.open();foldedPhone.call();foldedPhone.close();

        UpRightPhone upRightPhone = new UpRightPhone(new Xiaomi());
        upRightPhone.open();upRightPhone.call();upRightPhone.close();
    }
}
