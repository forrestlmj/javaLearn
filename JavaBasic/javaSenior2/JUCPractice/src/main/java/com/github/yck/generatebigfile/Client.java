package com.github.yck.generatebigfile;

import com.github.yck.generatebigfile.internal.BigFileWriterMultiThreading;

/**
 *
 * 文件随机写入用户的访问链接记录。
 *
 * 写入记录大概在2亿条（{@link Integer#MAX_VALUE /10}）
 * 最后写完的文件数量在 7.37GB 左右。
 * 最后会输出 TopN 的链接与记录数。
 */
public class Client {
    public static void main(String[] args) {
        new BigFileWriterMultiThreading().run();
    }
}
