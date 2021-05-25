package com.amazingReader.entity;

import java.util.Date;

public class ReportComment {
    private Integer reportId;

    private Integer commentId;

    /**
     * 保存举报评论的内容
     * 数据库无此字段
     */
    private Comment reportedComment;

    private Integer readerId;

    /**
     * 被举报人信息
     */
    private Reader reportReader;

    private Integer reportTypeId;

    private String reportReason;

    private Date reportTime;

    private String reportSolution;

    private Integer reportStatuId;

    private Integer reportManagerId;

    public Reader getReportReader() {
        return reportReader;
    }

    public void setReportReader(Reader reportReader) {
        this.reportReader = reportReader;
    }

    public Comment getReportedComment() {
        return reportedComment;
    }

    public void setReportedComment(Comment reportedComment) {
        this.reportedComment = reportedComment;
    }

    public Integer getReportId() {
        return reportId;
    }

    public void setReportId(Integer reportId) {
        this.reportId = reportId;
    }

    public Integer getCommentId() {
        return commentId;
    }

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    public Integer getReaderId() {
        return readerId;
    }

    public void setReaderId(Integer readerId) {
        this.readerId = readerId;
    }

    public Integer getReportTypeId() {
        return reportTypeId;
    }

    public void setReportTypeId(Integer reportTypeId) {
        this.reportTypeId = reportTypeId;
    }

    public String getReportReason() {
        return reportReason;
    }

    public void setReportReason(String reportReason) {
        this.reportReason = reportReason;
    }

    public Date getReportTime() {
        return reportTime;
    }

    public void setReportTime(Date reportTime) {
        this.reportTime = reportTime;
    }

    public String getReportSolution() {
        return reportSolution;
    }

    public void setReportSolution(String reportSolution) {
        this.reportSolution = reportSolution == null ? null : reportSolution.trim();
    }

    public Integer getReportStatuId() {
        return reportStatuId;
    }

    public void setReportStatuId(Integer reportStatuId) {
        this.reportStatuId = reportStatuId;
    }

    public Integer getReportManagerId() {
        return reportManagerId;
    }

    public void setReportManagerId(Integer reportManagerId) {
        this.reportManagerId = reportManagerId;
    }

    @Override
    public String toString() {
        return "ReportComment{" +
                "reportId=" + reportId +
                ", commentId=" + commentId +
                ", reportedComment=" + reportedComment +
                ", readerId=" + readerId +
                ", reportedReader=" + reportReader +
                ", reportTypeId=" + reportTypeId +
                ", reportReason='" + reportReason + '\'' +
                ", reportTime=" + reportTime +
                ", reportSolution='" + reportSolution + '\'' +
                ", reportStatuId=" + reportStatuId +
                ", reportManagerId=" + reportManagerId +
                '}';
    }
}