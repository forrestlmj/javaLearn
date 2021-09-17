package com.atguigu;

import org.junit.Test;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

/**
 *
 * 一、流的分类：
 * 1.操作数据单位：字节流、字符流
 * 2.数据的流向：输入流、输出流
 * 3.流的角色：节点流、处理流
 *
 * 二、流的体系结构
 * 抽象基类         节点流（或文件流）                               缓冲流（处理流的一种）
 * InputStream     FileInputStream   (read(byte[] buffer))        BufferedInputStream (read(byte[] buffer))
 * OutputStream    FileOutputStream  (write(byte[] buffer,0,len)  BufferedOutputStream (write(byte[] buffer,0,len) / flush()
 * Reader          FileReader (read(char[] cbuf))                 BufferedReader (read(char[] cbuf) / readLine())
 * Writer          FileWriter (write(char[] cbuf,0,len)           BufferedWriter (write(char[] cbuf,0,len) / flush()
 *
 *
 *
 * @author shkstart
 * @create 2019 上午 10:40
 */
public class FileReadWriteTest {
    public static void main(String[] args) {
        File file = new File("hello.txt");
        System.out.println(file.exists());
    }

    /**
     *    将day09下的hello.txt文件内容读入程序中，并输出到控制台
     *
     *     说明点：
     *     1. read()的理解：返回读入的一个字符。如果达到文件末尾，返回-1
     *     2. 异常的处理：为了保证流资源一定可以执行关闭操作。需要使用try-catch-finally处理
     *     3. 读入的文件一定要存在，否则就会报FileNotFoundException。
     */
    @Test
    public void testFileReader(){
        File file = new File("src\\main\\resources\\hello.txt");
//        System.out.println(file.exists());
        if(file.exists()){
            System.out.println(file.length());
            try {
                FileReader fileReader = new FileReader(file);
                //
                int c;
                while((c = fileReader.read()) != -1){
                    System.out.println((char) c);
                }
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

}
