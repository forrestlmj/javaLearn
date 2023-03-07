package com.github.yck.pattern.creational.prototype.shallowcopping;

import java.util.Map;

public class Address implements Cloneable {
    private String addressName;
    private Map<String, String> BackUpInfo;

    public String getAddressName() {
        return addressName;
    }

    public void setAddressName(String addressName) {
        this.addressName = addressName;
    }

    public Map<String, String> getBackUpInfo() {
        return BackUpInfo;
    }

    public void setBackUpInfo(Map<String, String> backUpInfo) {
        BackUpInfo = backUpInfo;
    }

    public Address(String addressName, Map<String, String> backUpInfo) {
        this.addressName = addressName;
        BackUpInfo = backUpInfo;
    }

    @Override
    protected Object clone() throws CloneNotSupportedException {
        return super.clone();
    }

    @Override
    public String toString() {
        return "Address{" +
                "addressName='" + addressName + '\'' +
                ", BackUpInfo=" + BackUpInfo +
                '}';
    }
}
