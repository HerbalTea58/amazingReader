package com.amazingReader.entity;

public class BookAndStyle {
    private Book book;
    private BookStyle bookStyle;
    private BookStatus bookStatus;
    private int num;

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public BookStatus getBookStatus() {
        return bookStatus;
    }

    public void setBookStatus(BookStatus bookStatus) {
        this.bookStatus = bookStatus;
    }

    public BookAndStyle() {
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public BookStyle getBookStyle() {
        return bookStyle;
    }

    public void setBookStyle(BookStyle bookStyle) {
        this.bookStyle = bookStyle;
    }
}
