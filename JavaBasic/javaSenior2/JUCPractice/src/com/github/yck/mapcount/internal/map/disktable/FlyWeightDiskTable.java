package com.github.yck.mapcount.internal.map.disktable;

import com.github.yck.mapcount.internal.map.memorytable.TableID;
import org.apache.commons.io.FileUtils;

import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class FlyWeightDiskTable implements DiskTable {
    private Map<TableID, File> FilePool;
    private String tmpWorkSpace;
    private static final String FILETYPE = ".txt";

    public FlyWeightDiskTable(String empWorkSpace) {
        FilePool  = new HashMap<>();
        initTempWorkSpace(empWorkSpace);
    }
    private String getFileName(TableID tableID){
        return tmpWorkSpace+tableID.getUuid()+FILETYPE;
    }
    @Override
    public void write(TableID tableId, List<String> content) {
        File file = FilePool.getOrDefault(tableId, new File(getFileName(tableId)));
        StringBuilder sb = new StringBuilder();
        content.forEach(o->sb.append(o));
        try {
            FileUtils.writeStringToFile(file,sb.toString(), Charset.defaultCharset());
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void clean() {

    }

    @Override
    public void initTempWorkSpace(String path) {
        try {
            FileUtils.deleteDirectory(new File(path));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        this.tmpWorkSpace = path;
    }
}
