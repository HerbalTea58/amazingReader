package com.amazingReader.mapper;

import java.util.List;

import com.amazingReader.entity.ReaderHobbyRelation;

public interface ReaderHobbyRelationMapper {

	public boolean add(ReaderHobbyRelation readerHobbyRelation);
	public boolean alter(int readerId, int before_labelId, int alter_labelId);
	public boolean remove(int readerId, int labelId);
	public List<ReaderHobbyRelation> getHobbyBy(int readerId);
}