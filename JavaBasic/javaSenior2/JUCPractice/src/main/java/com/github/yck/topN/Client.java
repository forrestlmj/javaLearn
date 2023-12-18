package com.github.yck.topN;


import com.github.yck.PATH;
import com.github.yck.topN.internal.TopNBuilder;
import com.github.yck.topN.internal.map.BigFileReader;
import com.github.yck.topN.internal.map.disktable.ByteDiskTable;
import com.github.yck.topN.internal.map.spliter.ByteSplitter;
import com.github.yck.topN.internal.map.spliter.StringListSplitter;
import com.github.yck.topN.internal.map.ck.SimpleCheckPoint;
import com.github.yck.topN.internal.map.disktable.StringListDiskTable;
import com.github.yck.topN.internal.map.strategy.SimpleModStrategy;

import java.io.IOException;

public class Client {

    public static void main(String[] args) throws IOException {
        new TopNBuilder().buildByteSplitter();
    }

}
