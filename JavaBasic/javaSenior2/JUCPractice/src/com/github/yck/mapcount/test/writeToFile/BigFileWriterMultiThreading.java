package com.github.yck.mapcount.test.writeToFile;

import org.apache.commons.io.FileUtils;

import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import java.util.*;
import java.util.concurrent.locks.ReentrantLock;

import static com.github.yck.mapcount.PATH.E_HDD_BIGFILE_PATH;
import static org.apache.commons.io.FileUtils.write;

class Writer implements Runnable {
    private final static String WEB_LINK = "http://www.facebook.com/";
    private final static Integer fileLine = Integer.MAX_VALUE;
    private final static File file = new File(E_HDD_BIGFILE_PATH);
    private final static Integer peopleCnt = 10000;
    private final static  Integer topN = 10;
    private Integer index = 0;
    Map<String,Integer> cnt = new <String,Integer>HashMap();
    private Integer BatchLine;
    Random r = new Random();
    PriorityQueue<HeapNode> priorityQueue = new PriorityQueue<>(topN);
    StringBuilder sb = new StringBuilder();
    public Writer(Integer batchLine) {
        BatchLine = batchLine;
        priorityQueue.offer(new HeapNode("",-1));
        try {
            FileUtils.delete(file);
        } catch (IOException e) {
        }

    }

    private ReentrantLock lock = new ReentrantLock();

    public void run()  {


        while (true){

            String data = (WEB_LINK+String.valueOf(r.nextInt(peopleCnt))+".index\n");
            sb.append(data);
            index++;
            if (index>fileLine)break;

            if (index % BatchLine == 0){
                System.out.println(Thread.currentThread().getName()+"已经写入："+index);
                try {
                    write(file,sb.toString(), Charset.defaultCharset(),true);
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
                sb = new StringBuilder();
            }


            try {


                lock.lock();
                Integer merge = cnt.merge(data, 1, (v1, v2) -> {
                    return v1 + v2;
                });


                if (merge>priorityQueue.peek().getCnt()){

                    if (priorityQueue.size()>topN-1) {
                        priorityQueue.poll();
                    }
                    priorityQueue.offer(new HeapNode(data,merge));
                }

            } catch (Exception e) {
                throw new RuntimeException(e);
            }finally {
                lock.unlock();
            }
        }

        System.out.println(priorityQueue);
    }
}

public class BigFileWriterMultiThreading {
    public static void main(String[] args) {
        Writer o = new Writer(100000);
//        o.init();
        Integer num = 8;
        List<Thread> l = new ArrayList<>(num);
        for (int i = 0; i < num; i++) {
            l.add(new Thread(o));
        }
        l.forEach(Thread::start);

    }

}
