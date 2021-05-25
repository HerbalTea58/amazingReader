package com.amazingReader.mapper;

import com.amazingReader.entity.Writer;
import com.amazingReader.entity.WriterIncome;

import java.util.Date;
import java.util.List;

public interface WriterMapper {
	//个人信息的操作
	boolean add(Writer writer);//作者注册
	boolean alter(Writer writer);//作者修改个人信息
	Writer getWriterByName(String writerName);//通过作者昵称 显示作者信息
	List<Writer> getWritersByName(String name);
	Writer getWriter(int writerId);
	Writer getWriterByTel(String writerTel);//通过作者昵称 显示作者信息

	public Double getMoney(int writerId);

	Integer getNumBydate(String time, int writerId);

	boolean ChangePass(int writerId, String password);
}