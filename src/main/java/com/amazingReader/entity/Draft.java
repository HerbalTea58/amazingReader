package com.amazingReader.entity;

import java.util.Date;

public class Draft {
    private Integer draftChapterNum;

    private Integer draftBookId;

    private String draftChapterName;

    private Integer draftWordNum;

    private Integer draftChapterPrice;

    private boolean draftChapterStatu;

    private String draftChapterContent;

    private Date draftEditTime;

    private Date draftUploadTime;

    private boolean draftChapterAddition;

    private String draftChapterAdditionCharacter;

    private String draftChapterAdditionImg1;

    private String draftChapterAdditionImg2;

    private String draftChapterAdditionImg3;

    private boolean draftStatu;

    private Integer draftCheckStatu;

    public Draft() {
    }

    public Integer getDraftChapterNum() {
        return draftChapterNum;
    }

    public void setDraftChapterNum(Integer draftChapterNum) {
        this.draftChapterNum = draftChapterNum;
    }

    public Integer getDraftBookId() {
        return draftBookId;
    }

    public void setDraftBookId(Integer draftBookId) {
        this.draftBookId = draftBookId;
    }

    public String getDraftChapterName() {
        return draftChapterName;
    }

    public void setDraftChapterName(String draftChapterName) {
        this.draftChapterName = draftChapterName;
    }

    public Integer getDraftWordNum() {
        return draftWordNum;
    }

    public void setDraftWordNum(Integer draftWordNum) {
        this.draftWordNum = draftWordNum;
    }

    public Integer getDraftChapterPrice() {
        return draftChapterPrice;
    }

    public void setDraftChapterPrice(Integer draftChapterPrice) {
        this.draftChapterPrice = draftChapterPrice;
    }

    public boolean isDraftChapterStatu() {
        return draftChapterStatu;
    }

    public void setDraftChapterStatu(boolean draftChapterStatu) {
        this.draftChapterStatu = draftChapterStatu;
    }

    public Date getDraftEditTime() {
        return draftEditTime;
    }

    public void setDraftEditTime(Date draftEditTime) {
        this.draftEditTime = draftEditTime;
    }

    public Date getDraftUploadTime() {
        return draftUploadTime;
    }

    public void setDraftUploadTime(Date draftUploadTime) {
        this.draftUploadTime = draftUploadTime;
    }

    public boolean isDraftChapterAddition() {
        return draftChapterAddition;
    }

    public void setDraftChapterAddition(boolean draftChapterAddition) {
        this.draftChapterAddition = draftChapterAddition;
    }

    public String getDraftChapterAdditionImg1() {
        return draftChapterAdditionImg1;
    }

    public void setDraftChapterAdditionImg1(String draftChapterAdditionImg1) {
        this.draftChapterAdditionImg1 = draftChapterAdditionImg1;
    }

    public String getDraftChapterAdditionImg2() {
        return draftChapterAdditionImg2;
    }

    public void setDraftChapterAdditionImg2(String draftChapterAdditionImg2) {
        this.draftChapterAdditionImg2 = draftChapterAdditionImg2;
    }

    public String getDraftChapterAdditionImg3() {
        return draftChapterAdditionImg3;
    }

    public void setDraftChapterAdditionImg3(String draftChapterAdditionImg3) {
        this.draftChapterAdditionImg3 = draftChapterAdditionImg3;
    }

    public boolean isDraftStatu() {
        return draftStatu;
    }

    public void setDraftStatu(boolean draftStatu) {
        this.draftStatu = draftStatu;
    }

    public String getDraftChapterContent() {
        return draftChapterContent;
    }

    public void setDraftChapterContent(String draftChapterContent) {
        this.draftChapterContent = draftChapterContent;
    }

    public String getDraftChapterAdditionCharacter() {
        return draftChapterAdditionCharacter;
    }

    public void setDraftChapterAdditionCharacter(String draftChapterAdditionCharacter) {
        this.draftChapterAdditionCharacter = draftChapterAdditionCharacter;
    }

    public Integer getDraftCheckStatu() {
        return draftCheckStatu;
    }

    public void setDraftCheckStatu(Integer draftCheckStatu) {
        this.draftCheckStatu = draftCheckStatu;
    }

    @Override
    public String toString() {
        return "Draft{" +
                "draftChapterNum=" + draftChapterNum +
                ", draftBookId=" + draftBookId +
                ", draftChapterName='" + draftChapterName + '\'' +
                ", draftWordNum=" + draftWordNum +
                ", draftChapterPrice=" + draftChapterPrice +
                ", draftChapterStatu=" + draftChapterStatu +
                ", draftChapterContent='" + draftChapterContent + '\'' +
                ", draftEditTime=" + draftEditTime +
                ", draftUploadTime=" + draftUploadTime +
                ", draftChapterAddition=" + draftChapterAddition +
                ", draftChapterAdditionCharacter='" + draftChapterAdditionCharacter + '\'' +
                ", draftChapterAdditionImg1='" + draftChapterAdditionImg1 + '\'' +
                ", draftChapterAdditionImg2='" + draftChapterAdditionImg2 + '\'' +
                ", draftChapterAdditionImg3='" + draftChapterAdditionImg3 + '\'' +
                ", draftStatu=" + draftStatu +
                ", draftCheckStatu=" + draftCheckStatu +
                '}';
    }
}
