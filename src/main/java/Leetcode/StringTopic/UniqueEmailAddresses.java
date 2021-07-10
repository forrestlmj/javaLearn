package Leetcode.StringTopic;

import java.util.HashSet;

public class UniqueEmailAddresses {
    public int numUniqueEmails(String[] emails) {
        HashSet<String> hashSet = new HashSet<String>();
        for(String email:emails){
            String pre = email.substring(0,email.indexOf("@"));
            String post = email.substring(email.indexOf("@"));

            StringBuilder s = new StringBuilder();
            for(char c:pre.toCharArray()){
                if(c == '+')
                    break;
                if(c != '.')
                    s.append(c);
            }
            hashSet.add(s.toString()+"@"+post);
        }
        return hashSet.size();
    }
}
