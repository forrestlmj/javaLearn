package com.atguigu;

import org.junit.Test;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;

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
        FileReader fileReader = null;
//        System.out.println(file.exists());
        if(file.exists()){
            System.out.println(file.length());
            try {
                fileReader = new FileReader(file);
                //
                int c;
                while((c = fileReader.read()) != -1){
                    System.out.println((char) c);
                }
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }finally {
                try {
                    fileReader.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
    @Test
    public void testFileReader1(){
        // 新建file
        File file = new File("D:\\IdeaProject\\javaLearn\\javaSenior\\day09\\src\\main\\resources\\hello.txt");
        // 新建FileReader
        FileReader fileReader = null ;
        // 读写
        try {
            fileReader = new FileReader(file);
            char[] cbuf = new char[5];
            int end ;
            while(( end = fileReader.read(cbuf)) != -1){
//                System.out.println(c);
                for (char c : cbuf) {
                    System.out.print(c);
                }

            }

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            if(fileReader != null){
                try {
                    fileReader.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        // 关闭读写流
    }

    /**
     *     从内存中写出数据到硬盘的文件里。
     *
     *     说明：
     *     1. 输出操作，对应的File可以不存在的。并不会报异常
     *     2.
     *          File对应的硬盘中的文件如果不存在，在输出的过程中，会自动创建此文件。
     *          File对应的硬盘中的文件如果存在：
     *                 如果流使用的构造器是：FileWriter(file,false) / FileWriter(file):对原有文件的覆盖
     *                 如果流使用的构造器是：FileWriter(file,true):不会对原有文件覆盖，而是在原有文件基础上追加内容
     */
    @Test
    public void testFileWriter(){
        File file = new File("D:\\IdeaProject\\javaLearn\\javaSenior\\day09\\src\\main\\resources\\write.txt");
        String context = "This should be write to file.";
        FileWriter fr = null;
        try {
            fr = new FileWriter(file,true);
            fr.write(context);
            fr.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    @Test
    public void testFileReaderAndWrite(){
        File srcFile = new File("D:\\IdeaProject\\javaLearn\\javaSenior\\day09\\src\\main\\resources\\src.txt");
        File targetFile = new File("D:\\IdeaProject\\javaLearn\\javaSenior\\day09\\src\\main\\resources\\target.txt");
        FileReader fr = null;
        FileWriter fw = null;
        try {
            fr = new FileReader(srcFile);
            fw = new FileWriter(targetFile,true);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        char[] cbuf = new char[5];
        int length;
        try {
            while ((length = fr.read(cbuf)) != -1){
//                System.out.print(cbuf );
//                fw.write(cbuf);
                for(int i = 0;i<length;i++){
                    fw.write(cbuf[i]);
                }
            }
            fw.write("\nEOF date:"
                    +new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())
            +"\n");
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            try {
                fw.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
            try {
                fr.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
