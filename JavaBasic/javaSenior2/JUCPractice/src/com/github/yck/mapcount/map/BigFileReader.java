package com.github.yck.mapcount.map;



import com.github.yck.mapcount.map.ck.CheckPoint;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.LineIterator;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class BigFileReader {
    public BigFileReader(Splitter splitter, String bigFilePath) {
        this.splitter = splitter;
        BigFilePath = bigFilePath;
    }

    Splitter splitter;
    String BigFilePath;
    public void run() throws IOException {
        File file = new File(BigFilePath);
        List<String> l = new ArrayList<>();
        LineIterator it = FileUtils.lineIterator(file, "UTF-8");
        try {
            while (it.hasNext()) {
                splitter.split(it.nextLine());
            }
            splitter.checkpoint();
        } finally {
            LineIterator.closeQuietly(it);
        }

    }
}
