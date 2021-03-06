package com.amazingReader.entity;


import java.util.Date;
import java.util.List;

public class Book {
    private Integer bookId;

    private String bookName;

    private Integer bookWriterId;

    private Integer bookStatuId;

    private Integer bookStyleId;

    private Integer bookRecommendTicket;

    private String bookShortDescribe;

    private Integer bookCollectedNum;

    private Boolean bookActivityStatu;

    private String bookCover;

    private Boolean bookDownShelf;

    private Integer clickTimes;

    private String styleName;

    private List<BookLabel> labels;

    private Integer wordsNum;

    private Date bookPushDateTime;

    private Integer readerNum;

    private Writer writer;

    private List<ChapterCheck> toCheckChapters;

    public List<ChapterCheck> getToCheckChapters() {
        return toCheckChapters;
    }

    public void setToCheckChapters(List<ChapterCheck> toCheckChapters) {
        this.toCheckChapters = toCheckChapters;
    }

    public Writer getWriter() {
        return writer;
    }

    public void setWriter(Writer writer) {
        this.writer = writer;
    }

    public Integer getReaderNum() {
        return readerNum;
    }

    public void setReaderNum(Integer readerNum) {
        this.readerNum = readerNum;
    }

    public void setBookDownShelf(Boolean bookDownShelf) {
        this.bookDownShelf = bookDownShelf;
    }

    public Date getBookPushDateTime() {
        return bookPushDateTime;
    }

    public void setBookPushDateTime(Date bookPushDateTime) {
        this.bookPushDateTime = bookPushDateTime;
    }

    public String getStyleName() {
        return styleName;
    }

    public void setStyleName(String styleName) {
        this.styleName = styleName;
    }

    public Integer getBookStatuId() {
        return bookStatuId;
    }

    public void setBookStatuId(Integer bookStatuId) {
        this.bookStatuId = bookStatuId;
    }

    public Boolean getBookDownShelf() {
        return bookDownShelf;
    }

    public void setBookDownShelf(boolean bookDownShelf) {
        this.bookDownShelf = bookDownShelf;
    }

    public Book(String bookName, Integer bookWriterId, Integer bookStatuId, Integer bookStyleId, Integer bookRecommendTicket, String bookShortDescribe, Integer bookCollectedNum, Boolean bookActivityStatu, String bookCover, boolean bookDownShelf, int clickTimes) {
        this.bookName = bookName;
        this.bookWriterId = bookWriterId;
        this.bookStatuId = bookStatuId;
        this.bookStyleId = bookStyleId;
        this.bookRecommendTicket = bookRecommendTicket;
        this.bookShortDescribe = bookShortDescribe;
        this.bookCollectedNum = bookCollectedNum;
        this.bookActivityStatu = bookActivityStatu;
        this.bookCover = bookCover;
        this.bookDownShelf = bookDownShelf;
        this.clickTimes = clickTimes;
    }


   /* public Book() {
		super();
		this.bookId = 0;
		this.bookWriterId = 0;
		this.bookStatuId = 0;
		this.bookStyleId = 0;
		this.bookRecommendTicket = 0;
		this.bookCollectedNum = 0;
		this.clickTimes = 0;
	}*/

    public Integer getWordsNum() {
        return wordsNum;
    }

    public void setWordsNum(Integer wordsNum) {
        this.wordsNum = wordsNum;
    }

    public List<BookLabel> getLabels() {
        return labels;
    }

    public void setLabels(List<BookLabel> labels) {
        this.labels = labels;
    }

    public Book() {
    }

    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName == null ? null : bookName.trim();
    }

    public Integer getBookWriterId() {
        return bookWriterId;
    }

    public void setBookWriterId(Integer bookWriterId) {
        this.bookWriterId = bookWriterId;
    }


    public Integer getBookStyleId() {
        return bookStyleId;
    }

    public void setBookStyleId(Integer bookStyleId) {
        this.bookStyleId = bookStyleId;
    }

    public Integer getBookRecommendTicket() {
        return bookRecommendTicket;
    }

    public void setBookRecommendTicket(Integer bookRecommendTicket) {
        this.bookRecommendTicket = bookRecommendTicket;
    }

    public String getBookShortDescribe() {
        return bookShortDescribe;
    }

    public void setBookShortDescribe(String bookShortDescribe) {
        this.bookShortDescribe = bookShortDescribe == null ? null : bookShortDescribe.trim();
    }

    public Integer getBookCollectedNum() {
        return bookCollectedNum;
    }

    public void setBookCollectedNum(Integer bookCollectedNum) {
        this.bookCollectedNum = bookCollectedNum;
    }

    public Boolean getBookActivityStatu() {
        return bookActivityStatu;
    }

    public void setBookActivityStatu(Boolean bookActivityStatu) {
        this.bookActivityStatu = bookActivityStatu;
    }

    public String getBookCover() {
        return bookCover;
    }

    public void setBookCover(String bookCover) {
        this.bookCover = bookCover;
    }

    public Integer getClickTimes() {
		return clickTimes;
	}



	public void setClickTimes(Integer clickTimes) {
		this.clickTimes = clickTimes;
	}

    @Override
    public String toString() {
        return "Book{" +
                "bookId=" + bookId +
                ", bookName='" + bookName + '\'' +
                ", bookWriterId=" + bookWriterId +
                ", bookStatuId=" + bookStatuId +
                ", bookStyleId=" + bookStyleId +
                ", bookRecommendTicket=" + bookRecommendTicket +
                ", bookShortDescribe='" + bookShortDescribe + '\'' +
                ", bookCollectedNum=" + bookCollectedNum +
                ", bookActivityStatu=" + bookActivityStatu +
                ", bookCover='" + bookCover + '\'' +
                ", bookDownShelf=" + bookDownShelf +
                ", clickTimes=" + clickTimes +
                ", styleName='" + styleName + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Book book = (Book) o;

        return bookId != null ? bookId.equals(book.bookId) : book.bookId == null;
    }

    @Override
    public int hashCode() {
        return bookId != null ? bookId.hashCode() : 0;
    }
}