package com.amazingReader.entity;


public class ChapterAdditionRemarks {
    private Integer bookChapterId;

    private String bookCharacter;
    
    private String bookImg1;

    private String bookImag2;

    private String bookImag3;

    public String getBookImg1() {
        return bookImg1;
    }

    public void setBookImg1(String bookImg1) {
        this.bookImg1 = bookImg1;
    }

    public String getBookImag2() {
        return bookImag2;
    }

    public void setBookImag2(String bookImag2) {
        this.bookImag2 = bookImag2;
    }

    public String getBookImag3() {
        return bookImag3;
    }

    public void setBookImag3(String bookImag3) {
        this.bookImag3 = bookImag3;
    }

    public Integer getBookChapterId() {
        return bookChapterId;
    }

    public void setBookChapterId(Integer bookChapterId) {
        this.bookChapterId = bookChapterId;
    }

    public String getBookCharacter() {
        return bookCharacter;
    }

    public void setBookCharacter(String bookCharacter) {
        this.bookCharacter = bookCharacter;
    }
}