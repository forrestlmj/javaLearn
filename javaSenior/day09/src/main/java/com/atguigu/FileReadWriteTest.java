package com.atguigu;

import java.io.File;

public class FileReadWriteTest {
    public static void main(String[] args) {
        File file = new File("hello.txt");
        System.out.println(file.exists());
    }
}
