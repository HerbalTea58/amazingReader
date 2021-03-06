package com.amazingReader.service.Interface;

import com.amazingReader.entity.*;
import com.amazingReader.entity.utilEntity.WriterBook;

import java.util.Collection;
import java.util.List;

public interface BookService {
	public static final double platformProfitPercentage = 0.1;
	public static final int thousandWordsPrice = 6;

	Book getBookInfoByChapterId(int chapterId);
	Book getBookInfoByBookId(int bookId);
	int getClickTimes(int bookId);
	int getRecommendTickets(int bookId);
	int getWordsNumOfBook(int bookId);
	int calculateBookPrice(int bookId);

	List<Chapter> getMenuOfBook(int bookId);
	Book getBookByName(String bookName);
	List<Book> getBooksByName(String name);
	List<Book> queryBooksOfMan();
	List<Book> queryBooksOfWoman();

	boolean isFinalChapter(int chapterId);
	List<Book> getBooksByBookStyle(int bookStyleId);
	public List<Book> showBooksPrepared(List<Book> bookList);
	List<Book> getBooksInfoByIds(List<Integer> booksIds);

	Integer getFirstChapterIdOfBook(int bookId);

	List<Book> getBooksByLabelId(int labelId);

	Book getBasicInfoOfBook(int bookId);

	List<Book> getBasicInfoOfBooks(List<Integer> bookIds);
	public BookStyle getBookStyle(int styleId);

	boolean alterBook(Book book);
	List<Book> getBookByWriterId(int writerId);
	Book getBook(int writerId,int bookId);

	List<BookStyle> getStyle(int styleId);


    Boolean isBookNameExit(String name);
	public BookStatus selectBookStatus(Book book);
	List<BookStyle> getMaleFirstLabel();//搜索男频的所有一级标签
	List<BookStyle> getFemaleFirstLabel();;//搜索女频的所有一级标签
	public BookStyle getBookStyleByName(String styleName);

	List<BookStyle> getStylesNameLike(String styleName);

	List<BookLabel> getlabelsNameLike(String typing);

    List<Book> getByLabelNameOrStyleName(String keyWord);

    boolean downShelfBook(Integer bookId);

	boolean reUpToShelfBook(Integer bookId);

	List<Book> getBooksByNameForManager(String keyWord);

    List<Book> getBookByWriterNameLike(String typing);

	BookStyle getFirstStyle(int styleId);

	boolean updatePic(int bookId, String imgfile);

    List<Book>  getAllDownShelfBooks();

    List<Book> queryByKeyWord(String keyWord);

	int getBookIdByName(String bookName);

	List<WriterBook> getBookByWriterId2(int writerId);

	List<Chapter> getAllFreeChapters(int bookId);

	List<Chapter> getBoughtChapters(Integer bookId, Integer readerId);

	BookStyle getBookStyleById(int id);
}
