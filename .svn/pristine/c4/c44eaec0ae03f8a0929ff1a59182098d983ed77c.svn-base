package com.amazingReader.mapper;

import java.util.List;

import com.amazingReader.entity.Question;

public interface QuestionMapper {
	//添加时问题处理状态应该默认为  未处理
	public boolean add(Question question);
	public boolean alter(Question question);
	public boolean remove(int questionID);
	public List<Question> getByManagerId(int managerID);
	
	public List<Question> getByWriterId(int WriterID);
}