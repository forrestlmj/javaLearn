package com.github.yck.pattern.structural.proxyAB.bridge;

public class UpRightPhone extends Phone {
    public UpRightPhone(Brand brand) {
        super(brand);
    }


    @Override
    public void call() {
        super.call();
        System.out.println(" 直立样式手机 ");

    }


}
