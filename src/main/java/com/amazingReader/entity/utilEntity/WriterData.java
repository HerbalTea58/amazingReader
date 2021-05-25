package com.amazingReader.entity.utilEntity;

import java.util.Date;

public class WriterData {
    private Integer chapterId;

    private String chapterName;

    private String bookName;

    private Integer chapterWordNum;

    private Integer chapterClickNum;

    private Boolean chapterStatu;

    private Date chapterRefreshTime;

    public WriterData() {
    }

    public Integer getChapterId() {
        return chapterId;
    }

    public void setChapterId(Integer chapterId) {
        this.chapterId = chapterId;
    }

    public String getChapterName() {
        return chapterName;
    }

    public void setChapterName(String chapterName) {
        this.chapterName = chapterName;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public Integer getChapterWordNum() {
        return chapterWordNum;
    }

    public void setChapterWordNum(Integer chapterWordNum) {
        this.chapterWordNum = chapterWordNum;
    }

    public Integer getChapterClickNum() {
        return chapterClickNum;
    }

    public void setChapterClickNum(Integer chapterClickNum) {
        this.chapterClickNum = chapterClickNum;
    }

    public Boolean getChapterStatu() {
        return chapterStatu;
    }

    public void setChapterStatu(Boolean chapterStatu) {
        this.chapterStatu = chapterStatu;
    }

    public Date getChapterRefreshTime() {
        return chapterRefreshTime;
    }

    public void setChapterRefreshTime(Date chapterRefreshTime) {
        this.chapterRefreshTime = chapterRefreshTime;
    }

    @Override
    public String toString() {
        return "WriterData{" +
                "chapterId=" + chapterId +
                ", chapterName='" + chapterName + '\'' +
                ", bookName='" + bookName + '\'' +
                ", chapterWordNum=" + chapterWordNum +
                ", chapterClickNum=" + chapterClickNum +
                ", chapterStatu=" + chapterStatu +
                ", chapterRefreshTime=" + chapterRefreshTime +
                '}';
    }
}
