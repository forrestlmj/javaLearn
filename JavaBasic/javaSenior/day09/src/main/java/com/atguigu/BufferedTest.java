package com.atguigu;

import org.junit.Test;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 处理流之一：缓冲流的使用
 *
 * 1.缓冲流：
 * BufferedInputStream
 * BufferedOutputStream
 * BufferedReader
 * BufferedWriter
 *
 * 2.作用：提供流的读取、写入的速度
 *   提高读写速度的原因：内部提供了一个缓冲区
 *
 * 3. 处理流，就是“套接”在已有的流的基础上。
 *
 * @author shkstart
 * @create 2019 下午 2:44
 */
public class BufferedTest {
    @Test
    public void BufferedStreamTest() throws IOException {
        FileInputStream fis = null;
        FileOutputStream fos = null;
        try {
            fis = new FileInputStream("D:\\BaiduNetdiskDownload\\笔记.zip");
            fos = new FileOutputStream("D:\\BaiduNetdiskDownload\\笔记3.zip");
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        BufferedInputStream bis = new BufferedInputStream(fis);
        BufferedOutputStream bos = new BufferedOutputStream(fos);

        byte[] buff = new byte[1024];
        int length;
        while((length = bis.read(buff)) != -1){
            bos.write(buff,0,length);
        }
        bis.close();
        bos.close();

    }

    public void copyFileWithBuffered(String srcFile, String targetFile) throws IOException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
        Date start = new Date();
        System.out.println(sdf.format(start)+": 开始拷贝文件");


        FileInputStream fis = null;
        FileOutputStream fos = null;
        fis = new FileInputStream(srcFile);
        fos = new FileOutputStream(targetFile);

        BufferedInputStream bis = new BufferedInputStream(fis);
        BufferedOutputStream bos = new BufferedOutputStream(fos);

        byte[] buff = new byte[1024];
        int length ;
        while((length = bis.read(buff)) != -1){
            bos.write(buff, 0, length);
        }
        bis.close();
        bos.close();
        Date end = new Date();
        long gap = end.getTime() - start.getTime();
        System.out.println(sdf.format(end) +": 结束拷贝文件，耗时"+gap+"毫秒");
    }

    @Test
    public void testCP() throws IOException {
        String srcPicFile = "D:\\BaiduNetdiskDownload\\资料.zip";
        String targetPicFile = "D:\\BaiduNetdiskDownload\\资料2.zip";
        copyFileWithBuffered(srcPicFile,targetPicFile);
    }
}
