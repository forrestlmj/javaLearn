package com.github.yck.pattern.factory;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 * 读取命令行
 * @see cmdUtilTest
 */
public class cmdUtil {
    public static String getType() {
        try {
            BufferedReader strin = new BufferedReader(new InputStreamReader(System.in));
            System.out.println("input pizza 种类:");
            String str = strin.readLine();
            return str;
        } catch (IOException e) {
            e.printStackTrace();
            return "";
        }
    }

    public static void main(String[] args) {
        for (int i = 0; i < 3; i++) {
            System.out.println(cmdUtil.getType());
        }
    }
}
