package com.amazingReader.mapper;

import com.amazingReader.entity.Book;
import com.amazingReader.entity.BookLabel;
import com.amazingReader.entity.BookStyle;

import java.util.List;

public interface BookStyleMapper {
	public boolean add(BookStyle bookStyle);
	public boolean alter(BookStyle bookStyle);
	public boolean remove(BookStyle bookStyle);
	public boolean removeById(int styleId);
	public BookStyle getBookStyle(int styleId);
	public List<BookStyle> getAllBookStyle();
	List<BookStyle> getStyle(int styleId);//通过一级类得到二级类
	List<BookStyle> getMaleFirstLabel();
	List<BookStyle> getFemaleFirstLabel();
	public BookStyle getBookStyleByName(String styleName);

    List<BookStyle> getStylesNameLike(String styleName);

	Integer getIdByStyleName();

	BookStyle getFirstStyle(int styleId); //通过二级类得到一级类

	}