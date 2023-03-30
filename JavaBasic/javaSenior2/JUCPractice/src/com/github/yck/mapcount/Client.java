package com.github.yck.mapcount;


import com.github.yck.mapcount.map.AbstractSplitter;
import com.github.yck.mapcount.map.BigFileReader;
import com.github.yck.mapcount.map.Splitter;
import com.github.yck.mapcount.map.ck.CheckPoint;
import com.github.yck.mapcount.map.ck.SimpleCheckPoint;
import com.github.yck.mapcount.map.strategy.SimpleStrategy;
import com.github.yck.mapcount.map.strategy.Strategy;

import java.io.IOException;

public class Client {

    public static void main(String[] args) throws IOException {
        Strategy s =  new SimpleStrategy(2);
        CheckPoint c = new SimpleCheckPoint(300);

        Splitter splitter = new AbstractSplitter(s,c);
        new BigFileReader(splitter,"E:\\JUCPractice\\MyBigfile.txt").run();
    }
}
