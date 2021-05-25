package com.amazingReader.entity;

public class Bookshelf {
    private Book book;
    private Writer writer;
    private Chapter maxchapter;
    private ReaderBookRelation readerBookRelation;
    private Chapter readingChapter;
    private BookStyle bookStyle;
    private String updateOrNot;
    private String downShelfOrNot;

    public String getDownShelfOrNot() {
        return downShelfOrNot;
    }

    public void setDownShelfOrNot(String downShelfOrNot) {
        this.downShelfOrNot = downShelfOrNot;
    }

    public String getUpdateOrNot() {
        return updateOrNot;
    }

    public void setUpdateOrNot(String updateOrNot) {
        this.updateOrNot = updateOrNot;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public Writer getWriter() {
        return writer;
    }

    public void setWriter(Writer writer) {
        this.writer = writer;
    }

    public Chapter getMaxchapter() {
        return maxchapter;
    }

    public void setMaxchapter(Chapter maxchapter) {
        this.maxchapter = maxchapter;
    }

    public ReaderBookRelation getReaderBookRelation() {
        return readerBookRelation;
    }

    public void setReaderBookRelation(ReaderBookRelation readerBookRelation) {
        this.readerBookRelation = readerBookRelation;
    }

    public Chapter getReadingChapter() {
        return readingChapter;
    }

    public void setReadingChapter(Chapter readingChapter) {
        this.readingChapter = readingChapter;
    }

    public BookStyle getBookStyle() {
        return bookStyle;
    }

    public void setBookStyle(BookStyle bookStyle) {
        this.bookStyle = bookStyle;
    }
}