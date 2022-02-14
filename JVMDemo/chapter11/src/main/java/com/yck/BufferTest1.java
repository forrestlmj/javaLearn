package com.yck;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;

/**
 * io 与 nio的对比，读写都使用100MB的缓存。
 * io使用的是堆内存，涉及用户态到内存态的两次复制。
 * nio使用的是直接内存，只有一次复制。
 */
public class BufferTest1  {
    private static final String TO = "";
    private static final int _100Mb = 1024 * 1024 * 100;

    public static void main(String[] args) {
        long sum = 0;
        String src = "D:\\VMVirtualBoxData\\centos\\data\\a.gz.mp4";
        for (int i = 0; i < 10; i++) {
            String dest = "D:\\VMVirtualBoxData\\centos\\data\\a.gz." + i + ".mp4";
//            sum += io(src,dest);//63901
            sum += directBuffer(src,dest);//64174
        }

        System.out.println("总花费的时间为：" + sum );
    }
    private static long directBuffer(String src,String dest) {
        long start = System.currentTimeMillis();

        FileChannel inChannel = null;
        FileChannel outChannel = null;
        try {
            inChannel = new FileInputStream(src).getChannel();
            outChannel = new FileOutputStream(dest).getChannel();

            ByteBuffer byteBuffer = ByteBuffer.allocateDirect(_100Mb);
            while (inChannel.read(byteBuffer) != -1) {
                byteBuffer.flip();//修改为读数据模式
                outChannel.write(byteBuffer);
                byteBuffer.clear();//清空
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (inChannel != null) {
                try {
                    inChannel.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }

            }
            if (outChannel != null) {
                try {
                    outChannel.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }

            }
        }

        long end = System.currentTimeMillis();
        return end - start;

    }

    private static long io(String src,String dest) {
        long start = System.currentTimeMillis();

        FileInputStream fis = null;
        FileOutputStream fos = null;
        try {
            fis = new FileInputStream(src);
            fos = new FileOutputStream(dest);
            byte[] buffer = new byte[_100Mb];
            while (true) {
                int len = fis.read(buffer);
                if (len == -1) {
                    break;
                }
                fos.write(buffer, 0, len);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (fis != null) {
                try {
                    fis.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }

            }
            if (fos != null) {
                try {
                    fos.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }

            }
        }


        long end = System.currentTimeMillis();

        return end - start;
    }
}
