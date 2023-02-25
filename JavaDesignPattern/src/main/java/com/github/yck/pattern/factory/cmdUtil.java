package com.github.yck.pattern.factory;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 * 读取命令行
 * @see
 */
public class cmdUtil {
    public static String getCmdInput(String inputMessage) {
        try {
            BufferedReader strin = new BufferedReader(new InputStreamReader(System.in));
            System.out.println(inputMessage);
            String str = strin.readLine();
            return str;
        } catch (IOException e) {
            e.printStackTrace();
            return "";
        }
    }


    public static void main(String[] args) {
        for (int i = 0; i < 3; i++) {
            System.out.println(cmdUtil.getCmdInput("input pizza 种类:"));
        }
    }
}
