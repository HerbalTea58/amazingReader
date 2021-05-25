package com.amazingReader.mapper;

import com.amazingReader.entity.ReaderRecommendTicketsRecord;

import java.util.List;

public interface ReaderRecommendTicketsRecordMapper {
    public Boolean addRecord(ReaderRecommendTicketsRecord readerRecommendTicketsRecord);
    public Boolean updateRecord(int tickets,int bookId,int readerId);
    public Boolean removeRecord(int recordId);
    public List<ReaderRecommendTicketsRecord> getRecordsByReaderId(int readerId);
    public int getUsedRecommendTicketsNumByReaderId(int readerId);
    public int getUsedRecommendTicketsNumByBookId(int bookId);
    public int getRecommendTicketsByRecordId(int recordId);

}
