package com.amazingReader.mapper;

import java.util.List;

import com.amazingReader.entity.Book;
import com.amazingReader.entity.ReaderBookRelation;

public interface ReaderBookRelationMapper {

	public boolean add(ReaderBookRelation readerBookRelation);
	public boolean alter(ReaderBookRelation readerBookRelation);
	public boolean remove(ReaderBookRelation readerBookRelation);
	public List<ReaderBookRelation> getByReaderId(int readerId);
	public int countBook(int readerId);
	public int countReader(int bookId);
	public List<ReaderBookRelation> getBookShelfBooksByWriterName(String writername,int readerId);//根据作者名字搜索书架里的书
	public ReaderBookRelation getBookShelfBooksByBookName(String bookname,int readerId);//根据书名字搜索书架里的书
	public Boolean removeReaderBookRelationByBookIdAndReaderId(int bookid,int readerId);

}