package com.amazingReader.entity;

import java.util.Date;

public class WriterOptionRecord {
    private Integer recordId;

    private Integer writerId;

    private Integer optionId;

    private Integer optionObjectId;

    private Date optionTime;

    public Integer getRecordId() {
        return recordId;
    }

    public void setRecordId(Integer recordId) {
        this.recordId = recordId;
    }

    public Integer getWriterId() {
        return writerId;
    }

    public void setWriterId(Integer writerId) {
        this.writerId = writerId;
    }

    public Integer getOptionId() {
        return optionId;
    }

    public void setOptionId(Integer optionId) {
        this.optionId = optionId;
    }

    public Integer getOptionObjectId() {
        return optionObjectId;
    }

    public void setOptionObjectId(Integer optionObjectId) {
        this.optionObjectId = optionObjectId;
    }

    public Date getOptionTime() {
        return optionTime;
    }

    public void setOptionTime(Date optionTime) {
        this.optionTime = optionTime;
    }
}