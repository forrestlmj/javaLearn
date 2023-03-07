package com.yzf.raphael.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：10/12/20 5:55 PM
 */


public class CheckEmail {

    public static boolean checkEmail(String email) {
        boolean flag = false;
        try {
            String check = "^([a-z0-9A-Z]+[-|_|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
            Pattern regex = Pattern.compile(check);
            Matcher matcher = regex.matcher(email);
            flag = matcher.matches();
        } catch (Exception e) {
            flag = false;
        }
        return flag;
    }
}
