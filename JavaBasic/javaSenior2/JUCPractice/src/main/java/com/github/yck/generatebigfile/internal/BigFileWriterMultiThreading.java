package com.github.yck.generatebigfile.internal;

import org.apache.commons.io.FileUtils;

import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import java.util.*;
import java.util.concurrent.locks.ReentrantLock;

import static com.github.yck.PATH.E_HDD_BIGFILE_PATH;
import static org.apache.commons.io.FileUtils.write;

class Writer implements Runnable {
    private static final String WEB_LINK = "http://www.facebook.com/";
    private Integer fileLine;



    private File file;
    private Integer peopleCnt;
    private Integer topN ;
    private Integer index =0;
    Map<String,Integer> cnt = new <String,Integer>HashMap();
    private Integer BatchLine;
    Random r = new Random();
    PriorityQueue<HeapNode> priorityQueue;
    StringBuilder sb = new StringBuilder();
    public Writer(File file,Integer fileLine ,Integer peopleCnt, Integer topN, Integer batchLine) {
        this.fileLine = fileLine;
        this.file = file;
        this.peopleCnt = peopleCnt;
        this.topN = topN;
        priorityQueue = new PriorityQueue<>(topN);
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
            try {
                lock.lock();
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
    public void run() {
        Writer o = new Writer(new File(E_HDD_BIGFILE_PATH),
                Integer.MAX_VALUE/10,
                1000000,
                10,
                100000);
//        o.init();
        Integer num = 8;
        List<Thread> l = new ArrayList<>(num);
        for (int i = 0; i < num; i++) {
            l.add(new Thread(o));
        }
        l.forEach(Thread::start);

    }

}
