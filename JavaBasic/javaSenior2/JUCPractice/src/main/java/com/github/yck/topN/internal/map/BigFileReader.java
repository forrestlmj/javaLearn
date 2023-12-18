package com.github.yck.topN.internal.map;



import com.github.yck.topN.internal.map.spliter.Splitter;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.LineIterator;

import java.io.File;
import java.io.IOException;

public class BigFileReader {
    public BigFileReader(Splitter splitter, String bigFilePath) {
        this.splitter = splitter;
        BigFilePath = bigFilePath;
    }

    Splitter splitter;
    String BigFilePath;
    public void run() throws IOException {
        File file = new File(BigFilePath);
        LineIterator it = FileUtils.lineIterator(file, "UTF-8");
        try {
            while (it.hasNext()) {
//                String s = ;
                splitter.split(it.nextLine());
            }
            splitter.checkpoint();
        } finally {
            LineIterator.closeQuietly(it);
        }

    }
}
