package com.github.yck.ds.string.history;

public class DefangingAnIpAddress {
    public String defangIPaddr(String address) {
        return address.replace(".","[.]");
    }
}
