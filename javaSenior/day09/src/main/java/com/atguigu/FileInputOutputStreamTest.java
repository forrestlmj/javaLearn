package com.atguigu;

import org.junit.Test;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 测试FileInputStream和FileOutputStream的使用
 *
 * 结论：
 * 1. 对于文本文件(.txt,.java,.c,.cpp)，使用字符流处理
 * 2. 对于非文本文件(.jpg,.mp3,.mp4,.avi,.doc,.ppt,...)，使用字节流处理
 *
 *
 *
 * @author shkstart
 * @create 2019 下午 2:13
 */
public class FileInputOutputStreamTest {
    @Test
    public void testFileInputStream(){
        //使用字节流FileInputStream处理文本文件，可能出现乱码
        FileInputStream fis = null;
        File file = new File("D:\\IdeaProject\\javaLearn\\javaSenior\\day09\\src\\main\\resources\\src.txt");
        try {
            fis = new FileInputStream(file);
            byte[] buff = new byte[10];
            int length = 0;

            while((length = fis.read(buff)) != -1){
                String s = new String(buff, 0, length);
                System.out.print(s);
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            try {
                fis.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 实现对图片的复制操作
     */
    @Test
    public void testFileInputOutputStream(){
        FileInputStream fis = null;
        FileOutputStream fos = null;
        try {
            fis = new FileInputStream("D:\\IdeaProject\\javaLearn\\javaSenior\\day09\\src\\main\\resources\\爱情与友情.jpg");
            fos = new FileOutputStream("D:\\IdeaProject\\javaLearn\\javaSenior\\day09\\src\\main\\resources\\爱情与友情1.jpg");
            byte[] buff = new byte[10];
            int length;
            while((length = fis.read(buff)) != -1){
                fos.write(buff);
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            try {
                fis.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
            try {
                fos.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 拷贝文件
     * @param srcFile
     * @param targetFile
     */
    public void copyFile(String srcFile, String targetFile,int buffSizeK)  {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
        Date start = new Date();
        System.out.println(sdf.format(start)+": 开始拷贝文件");

        FileInputStream fis = null;
        FileOutputStream fos = null;
        try {
            fis = new FileInputStream(srcFile);
            fos = new FileOutputStream(targetFile);
            byte[] buff = new byte[buffSizeK * 1024];
            int length = 0;
            while((length = fis.read(buff)) != -1){
                for(int i = 0; i< length ;i ++){
                    fos.write(buff[i]);
                }
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            try {
                fis.close();
                fos.close();


            } catch (IOException e) {
                e.printStackTrace();
            }
        }


        Date end = new Date();
        long gap = end.getTime() - start.getTime();
        System.out.println(sdf.format(end) +": 结束拷贝文件，耗时"+gap+"毫秒");
    }
    @Test
    public void testCopyFile(){
        String srcPicFile = "D:\\BaiduNetdiskDownload\\资料.zip";
        String targetPicFile = "D:\\BaiduNetdiskDownload\\资料2.zip";
        copyFile(srcPicFile,targetPicFile,10*1024);
    }

}
