package com.amazingReader.entity;

import java.util.Date;

public class Comment {
    private Integer commentId;

    private Integer commentTid;

    private Integer commentCommentedId;

    private Integer commentReaderId;

    private Integer commentBookId;

    private Integer commentChapterId;

    private Date commentPushDate;

    private String commentContent;

    private Integer commentLikeNum;

    private Boolean commentStatu;

    private Reader reader;

    private Reader CommentedReader;

    private Integer replyNum;

    private boolean amILiked;

    public boolean isAmILiked() {
        return amILiked;
    }

    public void setAmILiked(boolean amILiked) {
        this.amILiked = amILiked;
    }

    public Integer getReplyNum() {
        return replyNum;
    }

    public void setReplyNum(Integer replyNum) {
        this.replyNum = replyNum;
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

    /**
     * 用户评分
     */
    private Integer commentGraded;

    private boolean commentIsRead;
    
    public Comment() {
	}

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

    public Integer getCommentCommentedId() {
        return commentCommentedId;
    }

    public void setCommentCommentedId(Integer commentCommentedId) {
        this.commentCommentedId = commentCommentedId;
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

    public Integer getCommentChapterId() {
        return commentChapterId;
    }

    public void setCommentChapterId(Integer commentChapterId) {
        this.commentChapterId = commentChapterId;
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

    public Integer getCommentLikeNum() {
        return commentLikeNum;
    }

    public void setCommentLikeNum(Integer commentLikeNum) {
        this.commentLikeNum = commentLikeNum;
    }

    public Boolean getCommentStatu() {
        return commentStatu;
    }

    public void setCommentStatu(Boolean commentStatu) {
        this.commentStatu = commentStatu;
    }

    public Integer getCommentGraded() {
        return commentGraded;
    }

    public void setCommentGraded(Integer commentGraded) {
        this.commentGraded = commentGraded;
    }

    public boolean isCommentIsRead() {
        return commentIsRead;
    }

    public void setCommentIsRead(boolean commentIsRead) {
        this.commentIsRead = commentIsRead;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "commentId=" + commentId +
                ", commentTid=" + commentTid +
                ", commentCommentedId=" + commentCommentedId +
                ", commentReaderId=" + commentReaderId +
                ", commentBookId=" + commentBookId +
                ", commentChapterId=" + commentChapterId +
                ", commentPushDate=" + commentPushDate +
                ", commentContent='" + commentContent + '\'' +
                ", commentLikeNum=" + commentLikeNum +
                ", commentStatu=" + commentStatu +
                ", reader=" + reader +
                ", CommentedReader=" + CommentedReader +
                ", commentGraded=" + commentGraded +
                ", commentIsRead=" + commentIsRead +
                '}';
    }
}