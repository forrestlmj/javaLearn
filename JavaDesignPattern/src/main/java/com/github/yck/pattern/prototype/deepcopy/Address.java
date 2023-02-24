package com.github.yck.pattern.prototype.deepcopy;

import java.io.Serializable;
import java.util.Map;

public class Address implements Cloneable, Serializable {
    private String addressName;
    private Map<String, String> BackUpInfo;
    private static final long serialVersionUID = 1L;

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
    public Object clone() throws CloneNotSupportedException {
        return (Address) DeepCopyUtil.deepClone(this);
    }

    @Override
    public String toString() {
        return "Address{" +
                "addressName='" + addressName + '\'' +
                ", BackUpInfo=" + BackUpInfo +
                '}';
    }
}
