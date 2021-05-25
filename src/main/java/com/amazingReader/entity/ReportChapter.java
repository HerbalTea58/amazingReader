package com.amazingReader.entity;

import java.util.Date;

public class ReportChapter {
    private Integer reportId;

    private Integer chapterId;

    /**
     * 被举报章节
     */
    private Chapter reportedChapter;

    /**
     * 被举报章节所属作者
     */

    private Writer reportedWriter;

    private Integer readerId;

    private Integer reportTypeId;

    private String reportReason;

    private Date reportTime;

    private String reportSolution;

    private Integer reportStatuId;

    private String reportStatuName;

    private Integer reportManagerId;

    public String getReportStatuName() {
        return reportStatuName;
    }

    public void setReportStatuName(String reportStatuName) {
        this.reportStatuName = reportStatuName;
    }

    public Chapter getReportedChapter() {
        return reportedChapter;
    }

    public void setReportedChapter(Chapter reportedChapter) {
        this.reportedChapter = reportedChapter;
    }

    public Writer getReportedWriter() {
        return reportedWriter;
    }

    public void setReportedWriter(Writer reportedWriter) {
        this.reportedWriter = reportedWriter;
    }

    public Integer getReportId() {
        return reportId;
    }

    public void setReportId(Integer reportId) {
        this.reportId = reportId;
    }

    public Integer getChapterId() {
        return chapterId;
    }

    public void setChapterId(Integer chapterId) {
        this.chapterId = chapterId;
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
        this.reportReason = reportReason == null ? null : reportReason.trim();
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
}