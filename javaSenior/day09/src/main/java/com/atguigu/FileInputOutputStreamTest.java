package com.atguigu;

import org.junit.Test;

import java.io.*;

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
}
