package com.amazingReader.entity;



public class DealStatus {
    private Integer questionDealStatusId;

    private String questionDealStatusName;
    
    public DealStatus() {
	}

    public Integer getQuestionDealStatusId() {
        return questionDealStatusId;
    }

    public void setQuestionDealStatusId(Integer questionDealStatusId) {
        this.questionDealStatusId = questionDealStatusId;
    }

    public String getQuestionDealStatusName() {
        return questionDealStatusName;
    }

    public void setQuestionDealStatusName(String questionDealStatusName) {
        this.questionDealStatusName = questionDealStatusName == null ? null : questionDealStatusName.trim();
    }
}