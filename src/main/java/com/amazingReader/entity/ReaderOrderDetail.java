package com.amazingReader.entity;

public class ReaderOrderDetail {
    private Integer readerOrderId;

    private Integer readerOrderDetailChapterNum;

    private Integer readerOrderDetailBookId;

    private Integer readerOrderDetailPrice;
    
    private int readerId;
    
    public ReaderOrderDetail() {
	}

    public Integer getReaderOrderId() {
        return readerOrderId;
    }

    public void setReaderOrderId(Integer readerOrderId) {
        this.readerOrderId = readerOrderId;
    }

    public Integer getReaderOrderDetailChapterNum() {
        return readerOrderDetailChapterNum;
    }

    public void setReaderOrderDetailChapterNum(Integer readerOrderDetailChapterNum) {
        this.readerOrderDetailChapterNum = readerOrderDetailChapterNum;
    }

    public Integer getReaderOrderDetailBookId() {
        return readerOrderDetailBookId;
    }

    public void setReaderOrderDetailBookId(Integer readerOrderDetailBookId) {
        this.readerOrderDetailBookId = readerOrderDetailBookId;
    }

    public Integer getReaderOrderDetailPrice() {
        return readerOrderDetailPrice;
    }

    public void setReaderOrderDetailPrice(Integer readerOrderDetailPrice) {
        this.readerOrderDetailPrice = readerOrderDetailPrice;
    }

    public int getReaderId() {
		return readerId;
	}

	public void setReaderId(int readerId) {
		this.readerId = readerId;
	}
}