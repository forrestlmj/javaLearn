package com.github.yck.topN.internal.map.memorytable;

import com.github.yck.topN.internal.map.disktable.DiskTable;

public class ByteMemoryTable extends AbstractMemoryTable {
    private byte[] byteContent;
    private static final byte[] EOF = new byte[]{'\n'};
    private static final Integer KB = 1024;
    private double kbSize;
    private int cIndex;
    private int size;
    public ByteMemoryTable(TableID f, String data,int kbSize) {
        this.f = f;
        this.kbSize = kbSize;
        this.cIndex = 0;
        byteContent = new byte[kbSize*KB];
        add(data);
    }
    private void copyData(String data){
        byte[] bytes = data.getBytes();
        try {
            System.arraycopy(bytes,0,byteContent,cIndex,bytes.length);
            // 这里拷贝一个'\n'
            cIndex = cIndex + bytes.length;

        }catch (Exception e){
            System.out.println(e);
            System.out.println("cIndex:"+cIndex);
            System.out.println("byteContent:"+byteContent.length);
            System.out.println("bytes.length:"+bytes.length);
        }

    }
    @Override
    public void add(String data) {
        copyData(data);
        copyEOF();

    }

    private void copyEOF() {

        System.arraycopy(EOF,0,byteContent,cIndex,1);
            // 这里拷贝一个'\n'
        cIndex = cIndex + 1;

    }

    /**
     * 这里 cIndex 要初始化，
     * byteContent 严格来说应该全部赋予0
     */
    @Override
    public void clean() {
//        byteContent = new byte[mbSize*MB];
        this.cIndex = 0;
    }
    @Override
    public boolean flush(TableID id, DiskTable d) {
        d.write(getTableID(),byteContent,cIndex);
//        System.out.println("cIndex:"+cIndex);
        return true;
    }

}
