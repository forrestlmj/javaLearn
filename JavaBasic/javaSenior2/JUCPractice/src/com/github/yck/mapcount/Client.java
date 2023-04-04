package com.github.yck.mapcount;


import com.github.yck.mapcount.PATH;
import com.github.yck.mapcount.internal.BigFileReader;
import com.github.yck.mapcount.internal.map.spliter.SimpleSplitter;
import com.github.yck.mapcount.internal.map.ck.SimpleCheckPoint;
import com.github.yck.mapcount.internal.map.disktable.FlyWeightDiskTable;
import com.github.yck.mapcount.internal.map.strategy.SimpleModStrategy;

import java.io.IOException;

public class Client {

    public static void main(String[] args) throws IOException {

        new BigFileReader(
                new SimpleSplitter(
                        new SimpleModStrategy(2),
                        new SimpleCheckPoint(300),
                        new FlyWeightDiskTable(PATH.E_HDD_WORK_PATH)),
                PATH.E_HDD_BIGFILE_PATH
                ).run();
    }
}
