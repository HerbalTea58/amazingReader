package com.amazingReader.entity;

public class BookLabelRelation {
    private Integer bookId;

    private Integer labelId;
    
    public BookLabelRelation() {
	}

    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }

    public Integer getLabelId() {
        return labelId;
    }

    public void setLabelId(Integer labelId) {
        this.labelId = labelId;
    }
}