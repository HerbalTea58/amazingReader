package com.amazingReader.entity;

import java.util.Date;

public class Commentabmin {
    private Integer commentId;
    private Integer commentReaderId;
    private Integer commentCommentedId;
    private Integer commentTid;
    private Integer commentBookId;
    private Date commentPushDate;
    private String commentContent;
    private Reader replyreader;
    private Reader CommentedReader;
    private Book book;
    private Chapter commentChapter;
    private Reader reader;

    public Integer getCommentId() {
        return commentId;
    }

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    public Integer getCommentTid() {
        return commentTid;
    }

    public void setCommentTid(Integer commentTid) {
        this.commentTid = commentTid;
    }

    public Reader getReplyreader() {
        return replyreader;
    }

    public void setReplyreader(Reader replyreader) {
        this.replyreader = replyreader;
    }

    public Commentabmin() {
    }


    public Integer getCommentReaderId() {
        return commentReaderId;
    }

    public void setCommentReaderId(Integer commentReaderId) {
        this.commentReaderId = commentReaderId;
    }

    public Integer getCommentBookId() {
        return commentBookId;
    }

    public void setCommentBookId(Integer commentBookId) {
        this.commentBookId = commentBookId;
    }

    public Chapter getCommentChapter() {
        return commentChapter;
    }

    public void setCommentChapter(Chapter commentChapter) {
        this.commentChapter = commentChapter;
    }

    public Date getCommentPushDate() {
        return commentPushDate;
    }

    public void setCommentPushDate(Date commentPushDate) {
        this.commentPushDate = commentPushDate;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }



    public Reader getReader() {
        return reader;
    }

    public void setReader(Reader reader) {
        this.reader = reader;
    }

    public Reader getCommentedReader() {
        return CommentedReader;
    }

    public void setCommentedReader(Reader commentedReader) {
        CommentedReader = commentedReader;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public Integer getCommentCommentedId() {
        return commentCommentedId;
    }

    public void setCommentCommentedId(Integer commentCommentedId) {
        this.commentCommentedId = commentCommentedId;
    }
}
