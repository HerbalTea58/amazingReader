package com.amazingReader.entity;

import java.util.List;

public class Writer {
    private Integer writerId;

    private String writerNeckName;

    private String writerPassword;

    private String writerShortRecommend;

    private String writerRealName;

    private Boolean writerSex;

    private String writerAddress;

    private String writerTel;

    private Integer writerStatuId;

    private String writerPortrait;
    
    private String writerAccount;

    private String statuName;

    private Integer bookNum;

    private Integer curMonthIncome;

    private Integer preMonthIncome;

    private Integer totalSubscribeIncome;

    private List<Book> books;

    private Integer toCheckChapterNum;

    public Integer getToCheckChapterNum() {
        return toCheckChapterNum;
    }

    public void setToCheckChapterNum(Integer toCheckChapterNum) {
        this.toCheckChapterNum = toCheckChapterNum;
    }

    public List<Book> getBooks() {
        return books;
    }

    public void setBooks(List<Book> books) {
        this.books = books;
    }

    public Integer getCurMonthIncome() {
        return curMonthIncome;
    }

    public void setCurMonthIncome(Integer curMonthIncome) {
        this.curMonthIncome = curMonthIncome;
    }

    public Integer getPreMonthIncome() {
        return preMonthIncome;
    }

    public void setPreMonthIncome(Integer preMonthIncome) {
        this.preMonthIncome = preMonthIncome;
    }

    public Integer getTotalSubscribeIncome() {
        return totalSubscribeIncome;
    }

    public void setTotalSubscribeIncome(Integer totalSubscribeIncome) {
        this.totalSubscribeIncome = totalSubscribeIncome;
    }

    public Integer getBookNum() {
        return bookNum;
    }

    public void setBookNum(Integer bookNum) {
        this.bookNum = bookNum;
    }

    @Override
    public String toString() {
        return "Writer{" +
                "writerId=" + writerId +
                ", writerNeckName='" + writerNeckName + '\'' +
                ", writerPassword='" + writerPassword + '\'' +
                ", writerShortRecommend='" + writerShortRecommend + '\'' +
                ", writerRealName='" + writerRealName + '\'' +
                ", writerSex=" + writerSex +
                ", writerAddress='" + writerAddress + '\'' +
                ", writerTel='" + writerTel + '\'' +
                ", writerStatuId=" + writerStatuId +
                ", writerPortrait='" + writerPortrait + '\'' +
                ", writerAccount='" + writerAccount + '\'' +
                ", statuName='" + statuName + '\'' +
                '}';
    }

    public String getStatuName() {
        return statuName;
    }

    public void setStatuName(String statuName) {
        this.statuName = statuName;
    }

    public Writer() {
		super();
		this.writerId = 0;
		this.writerStatuId = 0;
	}

	public Integer getWriterId() {
        return writerId;
    }

    public void setWriterId(Integer writerId) {
        this.writerId = writerId;
    }

    public String getWriterNeckName() {
        return writerNeckName;
    }

    public void setWriterNeckName(String writerNeckName) {
        this.writerNeckName = writerNeckName == null ? null : writerNeckName.trim();
    }

    public String getWriterPassword() {
        return writerPassword;
    }

    public void setWriterPassword(String writerPassword) {
        this.writerPassword = writerPassword == null ? null : writerPassword.trim();
    }

    public String getWriterShortRecommend() {
        return writerShortRecommend;
    }

    public void setWriterShortRecommend(String writerShortRecommend) {
        this.writerShortRecommend = writerShortRecommend == null ? null : writerShortRecommend.trim();
    }

    public String getWriterRealName() {
        return writerRealName;
    }

    public void setWriterRealName(String writerRealName) {
        this.writerRealName = writerRealName == null ? null : writerRealName.trim();
    }

    public Boolean getWriterSex() {
        return writerSex;
    }

    public void setWriterSex(Boolean writerSex) {
        this.writerSex = writerSex;
    }

    public String getWriterAddress() {
        return writerAddress;
    }

    public void setWriterAddress(String writerAddress) {
        this.writerAddress = writerAddress == null ? null : writerAddress.trim();
    }

    public String getWriterTel() {
        return writerTel;
    }

    public void setWriterTel(String writerTel) {
        this.writerTel = writerTel == null ? null : writerTel.trim();
    }

    public Integer getWriterStatuId() {
        return writerStatuId;
    }

    public void setWriterStatuId(Integer writerStatuId) {
        this.writerStatuId = writerStatuId;
    }

    public String getWriterPortrait() {
        return writerPortrait;
    }

    public void setWriterPortrait(String writerPortrait) {
        this.writerPortrait = writerPortrait;
    }

    public String getWriterAccount() {
		return writerAccount;
	}

	public void setWriterAccount(String writerAccount) {
		this.writerAccount = writerAccount;
	}
}