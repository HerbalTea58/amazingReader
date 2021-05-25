package com.amazingReader.entity;

import java.util.List;

public class OrderIntroduce {
    private ReaderOrder readerOrder;
    private int readerOrderDetailnum;
    private Book book;
    private List<Chapter> chapter;
    private ReaderOrderType readerOrderType;
    public OrderIntroduce() {
    }
    public ReaderOrderType getReaderOrderType() {
        return readerOrderType;
    }

    public void setReaderOrderType(ReaderOrderType readerOrderType) {
        this.readerOrderType = readerOrderType;
    }

    public ReaderOrder getReaderOrder() {
        return readerOrder;
    }

    public void setReaderOrder(ReaderOrder readerOrder) {
        this.readerOrder = readerOrder;
    }

    public int getReaderOrderDetailnum() {
        return readerOrderDetailnum;
    }

    public void setReaderOrderDetailnum(int readerOrderDetailnum) {
        this.readerOrderDetailnum = readerOrderDetailnum;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public List<Chapter> getChapter() {
        return chapter;
    }

    public void setChapter(List<Chapter> chapter) {
        this.chapter = chapter;
    }
}
