package com.amazingReader.mapper;

import java.util.List;

import com.amazingReader.entity.BookLabel;

public interface BookLabelMapper {
	 int getMaxIndex();
	 boolean add(BookLabel bookLabel);
	 boolean alter(BookLabel bookLabel);
	 boolean removeBookLabelByBookLabe(BookLabel bookLabel);
	 boolean removeBookLabelByBookLabelId(int bookLabelId);
	 BookLabel getBookLabel(int labelId);
	 List<BookLabel> getBookLabels();

	List<Integer> getByLabelNameOrStyleName(String keyWord);//通过标签和style类型 查询

	List<BookLabel> getlabelsNameLike(String typing);


    Integer getByLabelName(String keyWord);

    boolean insertLabel(String keyWord);

}