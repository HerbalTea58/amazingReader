package com.amazingReader.mapper;

import com.amazingReader.entity.ReaderDivination;

public interface ReaderDivinationMapper {
/**
 * 
 */
	public ReaderDivination getById(int divinationId);
	public ReaderDivination getByBornMonth(int month);
}