package com.amazingReader.mapper;

import com.amazingReader.entity.Book;
import com.amazingReader.entity.BookStatus;

public interface BookStatusMapper {
	public boolean add(BookStatus bookStatus);
	public BookStatus getBookStatu(int statuId);
	public boolean remove(BookStatus bookStatus);

}