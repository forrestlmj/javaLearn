package com.atguigu;

import org.junit.Test;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;

/**
 * * File类的使用
 *  *
 *  * 1. File类的一个对象，代表一个文件或一个文件目录(俗称：文件夹)
 *  * 2. File类声明在java.io包下
 *  * 3. File类中涉及到关于文件或文件目录的创建、删除、重命名、修改时间、文件大小等方法，
 *  *    并未涉及到写入或读取文件内容的操作。如果需要读取或写入文件内容，必须使用IO流来完成。
 *  * 4. 后续File类的对象常会作为参数传递到流的构造器中，指明读取或写入的"终点".
 *  *
 *  *
 *  *
 *  *
 *  * @author shkstart
 *  * @create 2019 下午 4:05
 */
public class FileTest {
    /**
     *         File(String filePath)
     *         File(String parentPath,String childPath)
     *         File(File parentFile,String childPath)
     *
     *     2.
     *     相对路径：相较于某个路径下，指明的路径。
     *     绝对路径：包含盘符在内的文件或文件目录的路径
     *
     *     3.路径分隔符
     */
    @Test
    public void test1(){
        File file = new File("D:\\IdeaProject\\javaLearn\\javaSenior\\day08\\src\\main\\resources\\he.txt");
        System.out.println(file);

        File file1 = new File("D:\\IdeaProject\\javaLearn\\javaSenior\\day08\\src\\main\\resources", "he.txt");
        System.out.println(file1);

        File file2 = new File("he.txt");
        System.out.println(file2);
    }

    /**
     * public String getAbsolutePath()：获取绝对路径
     * public String getPath() ：获取路径
     * public String getName() ：获取名称
     * public String getParent()：获取上层文件目录路径。若无，返回null
     * public long length() ：获取文件长度（即：字节数）。不能获取目录的长度。
     * public long lastModified() ：获取最后一次的修改时间，毫秒值
     *
     * 如下的两个方法适用于文件目录：
     * public String[] list() ：获取指定目录下的所有文件或者文件目录的名称数组
     * public File[] listFiles() ：获取指定目录下的所有文件或者文件目录的File数组
     */
    @Test
    public void test2(){
        File file1 = new File("src/main/resources/he.txt");
        File file2 = new File("D:\\IdeaProject\\javaLearn\\javaSenior\\day08\\src\\main\\resources\\he.txt");

        System.out.println(file1.getAbsoluteFile());
        System.out.println(file1.getParent());
        System.out.println(file1.getName());
        System.out.println(file1.getParent());
        System.out.println(file1.length());
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        System.out.println(sdf.format(file1.lastModified()));

        System.out.println("------------> <------------");

        System.out.println(file2.getAbsolutePath());
        System.out.println(file2.getName());
        System.out.println(file2.length());
        System.out.println(file2.canRead());
    }

    @Test
    public void test3(){
        File file = new File("D:\\IdeaProject\\javaLearn\\javaSenior\\day08\\src\\main\\resources\\mydir");

        for (File listFile : file.listFiles()) {
            System.out.println(listFile);
        }
    }
    @Test
    public void test3_1(){
        System.out.println(listFile(new File("D:\\IdeaProject\\javaLearn\\javaSenior\\day08"), 0));
    }

    private int listFile(File f,int filecount){

        if(f.isFile()){
//            System.out.println(f.getAbsolutePath());
            filecount += 1;
            return filecount;
        }else{
            for (File file : f.listFiles()) {
                filecount = listFile(file,filecount);
                if (file.isFile()){
                    System.out.println("fileCount"+filecount+":"+file.getAbsolutePath());
                }else System.out.println(file.getAbsolutePath());

            }
            return filecount;
        }

    }

    /**
     * @throws InterruptedException
     *     public boolean renameTo(File dest):把文件重命名为指定的文件路径
     *      比如：file1.renameTo(file2)为例：
     *         要想保证返回true,需要file1在硬盘中是存在的，且file2不能在硬盘中存在。
     */
    @Test
    public void test4() throws InterruptedException {
        File file = new File("D:\\IdeaProject\\javaLearn\\javaSenior\\day08\\src\\main\\resources\\mydir\\1.txt");
        file.renameTo(new File("D:\\IdeaProject\\javaLearn\\javaSenior\\day08\\src\\main\\resources\\mydir\\1.to"));
//        Thread.sleep(1000*10);
    }

    /**
     * public boolean isDirectory()：判断是否是文件目录
     * public boolean isFile() ：判断是否是文件
     * public boolean exists() ：判断是否存在
     * public boolean canRead() ：判断是否可读
     * public boolean canWrite() ：判断是否可写
     * public boolean isHidden() ：判断是否隐藏
     */
    @Test
    public void test5(){



    }

    /**
     *     创建硬盘中对应的文件或文件目录
     * public boolean createNewFile() ：创建文件。若文件存在，则不创建，返回false
     * public boolean mkdir() ：创建文件目录。如果此文件目录存在，就不创建了。如果此文件目录的上层目录不存在，也不创建。
     * publtic boolean mkdirs() ：创建文件目录。如果此文件目录存在，就不创建了。如果上层文件目录不存在，一并创建
     *
     *     删除磁盘中的文件或文件目录
     * public boolean delete()：删除文件或者文件夹
     *     删除注意事项：Java中的删除不走回收站。
     */
    @Test
    public void test6() throws IOException {
        File file = new File("src/main/resources/hi.txt");
        if(!file.exists()){
            file.createNewFile();
            System.out.println("创建成功");
        }else {
            file.deleteOnExit();
            System.out.println("删除成功");
        }

    }
    @Test
    public void test7(){
        File file = new File("src/main/resources/dir1/dir2/dir3/a.txt");
//        boolean mkdirs = file.mkdirs();
        if(file.exists()){
            System.out.println("");
        }else{
            System.out.println(file.mkdirs());
        }
    }
    @Test
    public void test8(){
        System.out.println(1024*1024*2 >> 20);
    }
}
