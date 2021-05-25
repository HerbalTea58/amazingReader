package com.amazingReader.entity;

import java.util.Date;

public class ReaderBookRelation {
    private Integer readerId;

    private Integer readerBookBookId;

    private Integer readerBookReadingChapterNum;

    private Date readerBookAddTime;

    /**
     *
     */
    private Reader reader;

    private Book book;

    public Reader getReader() {
        return reader;
    }

    public void setReader(Reader reader) {
        this.reader = reader;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public ReaderBookRelation() {
	}

    public Integer getReaderId() {
        return readerId;
    }

    public void setReaderId(Integer readerId) {
        this.readerId = readerId;
    }

    public Integer getReaderBookBookId() {
        return readerBookBookId;
    }

    public void setReaderBookBookId(Integer readerBookBookId) {
        this.readerBookBookId = readerBookBookId;
    }

    public Integer getReaderBookReadingChapterNum() {
        return readerBookReadingChapterNum;
    }

    public void setReaderBookReadingChapterNum(Integer readerBookReadingChapterNum) {
        this.readerBookReadingChapterNum = readerBookReadingChapterNum;
    }

    public Date getReaderBookAddTime() {
        return readerBookAddTime;
    }

    public void setReaderBookAddTime(Date readerBookAddTime) {
        this.readerBookAddTime = readerBookAddTime;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ReaderBookRelation that = (ReaderBookRelation) o;

        if (readerId != null ? !readerId.equals(that.readerId) : that.readerId != null) return false;
        return readerBookBookId != null ? readerBookBookId.equals(that.readerBookBookId) : that.readerBookBookId == null;
    }

    @Override
    public int hashCode() {
        int result = readerId != null ? readerId.hashCode() : 0;
        result = 31 * result + (readerBookBookId != null ? readerBookBookId.hashCode() : 0);
        return result;
    }
}