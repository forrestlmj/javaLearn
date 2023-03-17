package com.github.yck.pattern.structural.proxyAB.bridge;

public class FoldedPhone extends Phone {

    public FoldedPhone(Brand brand) {
        super(brand);
    }



    @Override
    public void call() {
        super.call();
        System.out.println(" 折叠样式手机 ");

    }

}
