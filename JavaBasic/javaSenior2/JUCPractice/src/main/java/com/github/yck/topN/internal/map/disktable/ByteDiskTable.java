package com.github.yck.topN.internal.map.disktable;

import com.github.yck.topN.internal.map.memorytable.TableID;
import org.apache.commons.io.FileUtils;

import java.io.File;
import java.io.IOException;

public class ByteDiskTable extends AbstractDiskTable {

    public ByteDiskTable(String empWorkSpace) {
        super(empWorkSpace);
    }

    /**
     *
     * @param tableId
     * @param content
     */
    @Override
    public void write(TableID tableId, byte[] content,int offset) {
        File file = FilePool.getOrDefault(tableId, new File(getFileName(tableId)));
        try {
            FileUtils.writeByteArrayToFile(file,content,0,offset,true);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
