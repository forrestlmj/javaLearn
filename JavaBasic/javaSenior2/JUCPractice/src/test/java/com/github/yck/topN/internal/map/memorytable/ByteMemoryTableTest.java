package com.github.yck.topN.internal.map.memorytable;

import com.github.yck.PATH;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 */
class ByteMemoryTableTest {
    private List<String> data = new ArrayList<>();

    @BeforeEach
    public void prepare(){
        int size = 1000000;
        int testSize = 2;
        for (int i = 0; i < size; i++) {
            data.add("http://www.baidu.com/1.index\n");
            data.add("http://www.baidu.com/11.index\n");
            data.add("http://www.baidu.com/1.index\n");
            data.add("http://www.baidu.com/11.index\n");
            data.add("http://www.baidu.com/12.index\n");
            data.add("http://www.baidu.com/1.index\n");
            data.add("http://www.baidu.com/13.index\n");
            data.add("http://www.baidu.com/11.index\n");
            data.add("http://www.baidu.com/1.index\n");
            data.add("http://www.baidu.com/1.index\n");
            data.add("http://www.baidu.com/21.index\n");
            data.add("http://www.baidu.com/1.index\n");
            data.add("奇怪\n");
            data.add("http://www.baidu.com/1.index\n");
            data.add("http://www.baidu.com/21.index\n");
            data.add("啊哈\n");
            data.add("http://www.baidu.com/1.index\n");
            data.add("http://www.baidu.com/13.index\n");
            data.add("http://www.baidu.com/11.index\n");
            data.add("http://www.baidu.com/1.index\n");
            data.add("最后一个\n");
        }
    }

    /**
     * 12795 毫秒
     * @throws IOException
     */
    public void writeByte() throws IOException {
        Integer MB = 1024 * 1024;
        int cIndex = 0;
        byte[] c = new byte[700*MB];

        for (String datum : data) {
            byte[] bytes = datum.getBytes();
            System.arraycopy(bytes,0,c,cIndex,bytes.length);
            cIndex = cIndex + bytes.length;
        }
        System.out.println(c);
        File f = new File(PATH.TEST_FILE);
        FileUtils.delete(f);
//        FileUtils.writeByteArrayToFile(f,c,true);
        FileUtils.writeByteArrayToFile(f,c,0,cIndex,true);
    }

    public void writeString() throws IOException {
        StringBuilder stringBuilder = new StringBuilder();
        for (int i = 0; i < data.size(); i++) {
            stringBuilder.append(data.get(i));
        }
        File f = new File(PATH.TEST_FILE);
        FileUtils.delete(f);
        FileUtils.write(f,stringBuilder.toString(),true);
    }
    @Test
    public void testCopy() throws IOException {
        while (true){
            long start = System.currentTimeMillis();
            writeString();
            long end = System.currentTimeMillis();
            System.out.println(end-start);

        }


    }

}