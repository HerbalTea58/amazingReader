package com.amazingReader.mapper;

import java.util.List;

import com.amazingReader.entity.WriterOptionRecord;

public interface WriterOptionRecordMapper {

	boolean add(WriterOptionRecord writerOptionRecord);
	List<WriterOptionRecord> getByWriterId(int writer);
	
}