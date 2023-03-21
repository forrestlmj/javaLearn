package com.github.yck.ds.string.history;

public class SplitAStringInBalancedStrings {
    public int balancedStringSplit(String s) {
        int flag = 0;
        int timer = 0;
        for(int i = 0;i < s.length(); i ++){
            if(s.charAt(i) == 'R'){
                flag += 1;
            }else{
                flag -= 1;
            }
            if (flag == 0){
                timer += 1;
            }
        }
        return timer;
    }
}
