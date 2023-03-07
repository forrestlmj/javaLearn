package com.atguigu.spring5;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：10/12/20 8:23 PM
 */


public class Book {
    @Override
    public String toString() {
        return "Book{" +
                "bname='" + bname + '\'' +
                ", bauthor='" + bauthor + '\'' +
                '}';
    }

    private String bname;

    public void setBauthor(String bauthor) {
        this.bauthor = bauthor;
    }

    private String bauthor;
    public void setBname(String bname){
        this.bname = bname;
    }
}
