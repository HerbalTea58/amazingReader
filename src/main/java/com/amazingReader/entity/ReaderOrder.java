package com.amazingReader.entity;

import java.util.Date;

public class ReaderOrder {
    private Integer readerOrderId;

    private Integer readerId;

    private Integer readerOrderTypeId;

    private int readerOrderPrice;

    private Integer readerOrderObjectId;

    private Date readerOrderTime;

    public boolean readerOrderDetail;

    //private ReaderOrderDetail readerOrderDetail1;

    
    public ReaderOrder() {
	}

    public Integer getReaderOrderId() {
        return readerOrderId;
    }

    public void setReaderOrderId(Integer readerOrderId) {
        this.readerOrderId = readerOrderId;
    }

    public Integer getReaderOrderTypeId() {
        return readerOrderTypeId;
    }

    public void setReaderOrderTypeId(Integer readerOrderTypeId) {
        this.readerOrderTypeId = readerOrderTypeId;
    }

    public int getReaderOrderPrice() {
        return readerOrderPrice;
    }

    public void setReaderOrderPrice(int readerOrderPrice) {
        this.readerOrderPrice = readerOrderPrice;
    }

    public Integer getReaderOrderObjectId() {
        return readerOrderObjectId;
    }

    public void setReaderOrderObjectId(Integer readerOrderObjectId) {
        this.readerOrderObjectId = readerOrderObjectId;
    }

    public Date getReaderOrderTime() {
        return readerOrderTime;
    }

    public void setReaderOrderTime(Date readerOrderTime) {
        this.readerOrderTime = readerOrderTime;
    }

    public boolean isReaderOrderDetail() {
        return readerOrderDetail;
    }

    public void setReaderOrderDetail(boolean readerOrderDetail) {
        this.readerOrderDetail = readerOrderDetail;
    }

    public Integer getReaderId() {
		return readerId;
	}

	public void setReaderId(Integer readerId) {
		this.readerId = readerId;
	}
}