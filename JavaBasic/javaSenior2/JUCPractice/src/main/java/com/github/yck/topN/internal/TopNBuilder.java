package com.github.yck.topN.internal;

import com.github.yck.PATH;
import com.github.yck.topN.internal.map.BigFileReader;
import com.github.yck.topN.internal.map.ck.SimpleCheckPoint;
import com.github.yck.topN.internal.map.disktable.ByteDiskTable;
import com.github.yck.topN.internal.map.disktable.StringListDiskTable;
import com.github.yck.topN.internal.map.spliter.ByteSplitter;
import com.github.yck.topN.internal.map.spliter.StringListSplitter;
import com.github.yck.topN.internal.map.strategy.SimpleModStrategy;

import java.io.IOException;

public class TopNBuilder {
    /**
     *可以跑 每批处理10万条，分到100个文件，每个文件1000行。
     * 一次写入的每个文件应该在 34kb - 40kb 之间（1000行*37列/1024=36K））
     * 一次写入的这100个文件最大内存用量在 3.4mb - 4.0mb 之间
     * 所以：-Xmx10m -Xms10m
     *
     * 运行结果
     * 开始时间：2023-04-05T22:09:05.304完成第1次 CheckPoint，共处理100000 条数据
     * 结束时间：2023-04-05T22:42:08.786完成第2147次 CheckPoint，共处理214700000 条数据
     * @throws IOException
     */
    public void buildByteSplitter() throws IOException {
        new BigFileReader(
                new ByteSplitter(
                        new SimpleModStrategy(100),
                        new SimpleCheckPoint(100000),
                        new ByteDiskTable(PATH.E_HDD_WORK_PATH),45),
                PATH.E_HDD_BIGFILE_PATH
        ).run();
    }
    @Deprecated
    public void buildStringListSplitter() throws IOException {
        new BigFileReader(
                new StringListSplitter(
                        new SimpleModStrategy(2),
                        new SimpleCheckPoint(10000),
                        new StringListDiskTable(PATH.E_HDD_WORK_PATH)),
                PATH.E_HDD_BIGFILE_PATH
        ).run();
    }

    /**
     * 使用 -Xmx4g -Xms4g 配置运行。
     * 2023-04-05T18:39:41.839完成第1次，2023-04-05T18:41:41.400完成第18次
     * @throws IOException
     */
    @Deprecated
    public void buildBigtestByteSplitter() throws IOException {
        new BigFileReader(
                new ByteSplitter(
                        new SimpleModStrategy(50),
                        new SimpleCheckPoint(10000000),
                        new ByteDiskTable(PATH.E_HDD_WORK_PATH),10*1024),
                PATH.E_HDD_BIGFILE_PATH
        ).run();
    }
}
