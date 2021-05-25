package com.amazingReader.mapper;

import com.amazingReader.entity.BookLabel;
import com.amazingReader.entity.BookLabelRelation;

import java.util.List;

public interface BookLabelRelationMapper {
	public int getMaxIndex();
	public boolean add(BookLabelRelation bookLabelRelation);
	public boolean alter(int book_id, int label_id, int newlabel_id);
	public boolean remove(BookLabelRelation bookLabelRelation);
	public boolean removeByLabelId(int bookLabelId);
	public boolean removeByBookId(int bookId);

	List<BookLabel> getLabelsOfBook(int bookId);
}