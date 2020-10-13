package Leetcode.StringTopic;

public class DefangingAnIpAddress {
    public String defangIPaddr(String address) {
        return address.replace(".","[.]");
    }
}
