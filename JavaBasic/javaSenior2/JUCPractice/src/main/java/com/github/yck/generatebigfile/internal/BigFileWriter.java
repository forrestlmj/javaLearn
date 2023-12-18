package com.github.yck.generatebigfile.internal;

import org.apache.commons.io.FileUtils;

import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import java.util.*;

import static com.github.yck.PATH.E_HDD_BIGFILE_PATH;


/**
 *
 */
class HeapNode implements Comparable<HeapNode>{
    private String web;

    public String getWeb() {
        return web;
    }

    public void setWeb(String web) {
        this.web = web;
    }

    public Integer getCnt() {
        return cnt;
    }

    public void setCnt(Integer cnt) {
        this.cnt = cnt;
    }

    public HeapNode(String web, Integer cnt) {
        this.web = web;
        this.cnt = cnt;
    }

    private Integer cnt;



    @Override
    public int compareTo(HeapNode o) {
        return this.cnt.compareTo(o.cnt);
    }

    @Override
    public String toString() {
        return "HeapNode{" +
                "web='" + web + '\'' +
                ", cnt=" + cnt +
                '}';
    }
}

/**
 * 单线程的写入，效率低不要用
 */
@Deprecated
class BigFileReaderTest {
    public static void main(String[] args) throws IOException {
        BigFileReaderTest b = new BigFileReaderTest();
        b.prepareLinkFile();
    }
    private final static String WEB_LINK = "http://www.facebook.com/";
    /**
     * 随机往 BIGFILE_PATH 写入内容
     */
    public void prepareLinkFile() throws IOException {
        File file = new File(E_HDD_BIGFILE_PATH);
        Integer fileLine = 10000000;
        Integer peopleCnt = 21;
        Integer topN = 10;


        Map<String,Integer> cnt = new <String,Integer>HashMap();
        Random r = new Random();
        try {
            FileUtils.delete(file);
        }catch (Exception e){}


        PriorityQueue<HeapNode> priorityQueue = new PriorityQueue<>(topN);
        priorityQueue.offer(new HeapNode("",-1));
        for (int i = 0; i < fileLine; i++) {
            if (i % 1000 == 0){
                System.out.println("已经写入："+i);
            }
           String data = (WEB_LINK+r.nextInt(peopleCnt)+".index\n");
            try {

                FileUtils.writeStringToFile(file,data, Charset.defaultCharset(),true);
                Integer merge = cnt.merge(data, 1, (v1, v2) -> {
                    return v1 + v2;
                });

                if (merge>priorityQueue.peek().getCnt()){

                    if (priorityQueue.size()>topN-1) {
                        priorityQueue.poll();
                    }
                    priorityQueue.offer(new HeapNode(data,merge));
                }

            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
        String a = "a";

        System.out.println(priorityQueue);
    }

}