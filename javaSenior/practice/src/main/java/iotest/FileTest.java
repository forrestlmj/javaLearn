package iotest;

import org.junit.Test;

import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class FileTest {
    @Test
    public void test() throws IOException {
        File file = new File("abc.txt");
        System.out.println(file.getAbsoluteFile());
        System.out.println(file.exists());
        System.out.println(file.createNewFile());
    }

    @Test
    public void test1(){

        File file = new File("D:" + File.separator + "tmp" + File.separator + "abc");
        System.out.println(file.getAbsoluteFile());
        if(!file.exists()){
            System.out.println(file.mkdirs());
        }
    }

    @Test
    public void test2() throws IOException {
        File file = new File("abc.txt");
//        file.createNewFile();
        FileReader fr = new FileReader(file);



        char[] buff = new char[1024];
        int len;
        while ((len = fr.read(buff)) != -1){
            System.out.println(new String(buff,0,len));
        }
    }

    @Test
    public void test3() throws IOException {
        File file = new File("abc.txt");
        FileWriter fw = new FileWriter(file);

        fw.write("abc\n");
        fw.write("cde");
        fw.flush();

    }

}
