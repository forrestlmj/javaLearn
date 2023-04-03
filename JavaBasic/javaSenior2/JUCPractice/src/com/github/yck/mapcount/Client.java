package com.github.yck.mapcount;


import com.github.yck.mapcount.map.AbstractSplitter;
import com.github.yck.mapcount.map.BigFileReader;
import com.github.yck.mapcount.map.ck.SimpleCheckPoint;
import com.github.yck.mapcount.map.strategy.SimpleModStrategy;

import java.io.IOException;

public class Client {

    public static void main(String[] args) throws IOException {

        new BigFileReader(
                new AbstractSplitter(
                        new SimpleModStrategy(2),
                        new SimpleCheckPoint(300)),
                "E:\\JUCPractice\\MyBigfile.txt").run();
    }
}
