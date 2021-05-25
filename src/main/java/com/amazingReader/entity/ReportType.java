package com.amazingReader.entity;

public class ReportType {
    private Integer reportTypeId;

    private String reportTypeName;

    public Integer getReportTypeId() {
        return reportTypeId;
    }

    public void setReportTypeId(Integer reportTypeId) {
        this.reportTypeId = reportTypeId;
    }

    public String getReportTypeName() {
        return reportTypeName;
    }

    public void setReportTypeName(String reportTypeName) {
        this.reportTypeName = reportTypeName == null ? null : reportTypeName.trim();
    }
}