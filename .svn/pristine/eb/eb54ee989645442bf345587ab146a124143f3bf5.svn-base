package com.amazingReader.mapper;

import java.util.List;

import com.amazingReader.entity.ReaderReadingRecord;

public interface ReaderReadingRecordMapper {
	boolean add(ReaderReadingRecord readerReadingRecord);
	boolean alter(ReaderReadingRecord readerReadingRecord);
	boolean remove(int readerId, int bookID);
	ReaderReadingRecord getByBookIdAndReaderId(int readerId, int bookID);
	List<ReaderReadingRecord> getReaderReadingRecord(int readerId);
}