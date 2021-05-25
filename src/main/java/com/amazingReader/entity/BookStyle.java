package com.amazingReader.entity;

public class BookStyle {
    private Integer bookStyleId;

    private String bookStyleName;
    
    public BookStyle() {
	}

    public Integer getBookStyleId() {
        return bookStyleId;
    }

    public void setBookStyleId(Integer bookStyleId) {
        this.bookStyleId = bookStyleId;
    }

    public String getBookStyleName() {
        return bookStyleName;
    }

    public void setBookStyleName(String bookStyleName) {
        this.bookStyleName = bookStyleName == null ? null : bookStyleName.trim();
    }
}