package com.github.yck.mapcount.internal.map.spliter;

import java.util.List;

public interface Splitter {
    void splitToFile(List<String> content);
    void split(String content);
//    void writeToMemory(String s);
    void checkpoint();

}
