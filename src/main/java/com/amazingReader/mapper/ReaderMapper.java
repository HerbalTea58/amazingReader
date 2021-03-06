package com.amazingReader.mapper;

import com.amazingReader.entity.BookLabel;
import com.amazingReader.entity.BookStyle;
import com.amazingReader.entity.Reader;

import java.util.List;

public interface ReaderMapper {
	//?????Reader里有数据在添加时应该有默认值，修改时不能手动修改
	//从页面传默认值还是数据库自动添加默认值？
	boolean add(Reader reader);
	boolean alter(Reader reader);
	boolean remove(int readerId);
	Reader getReader(int readerId);
	Reader getReaderByName(String readerNeckName);
	Reader getReaderByTel(String readerTel);
	List<BookStyle> getReaderLabelByID(int readerId);
	//通过读者id 获得喜爱标签的集合
	public List<Integer> selectStyleIdsByReaderId(int readerId);
	public  Boolean updateReaderPortrait(int readerId,String picture);
	boolean updateBalance(int balance,int readerId);
	public boolean updateReaderName(String name,int readerId);
	public boolean alterReaderPassword(String password,int readerId);
	public Integer getReaderBalance(int readerId);

}