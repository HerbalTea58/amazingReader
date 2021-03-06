package com.amazingReader.service.Impl;

import com.amazingReader.entity.*;
import com.amazingReader.entity.utilEntity.WriterBook;
import com.amazingReader.mapper.*;
import com.amazingReader.service.Interface.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
public class BookServiceImpl implements BookService {
    @Autowired
    private BookMapper bookMapper;
    @Autowired
    private ChapterMapper chapterMapper;
    @Autowired
    private BookStyleMapper bookStyleMapper;
    @Autowired
    private BookLabelRelationMapper bookLabelRelationMapper;
    @Autowired
    private ReaderBookRelationMapper readerBookRelationMapper;
    @Autowired
    private WriterMapper writerMapper;
    @Autowired
    private BookStatusMapper bookStatusMapper;
    @Autowired
    private BookLabelMapper bookLabelMapper;

    @Transactional(propagation= Propagation.REQUIRED,isolation = Isolation.DEFAULT)
    @Override
    public Book getBookInfoByChapterId(int chapterId) {
        int bookId = chapterMapper.getChapterById(chapterId).getChapterBookId();
        return getBookInfoByBookId(bookId);
    }
    @Transactional(propagation= Propagation.REQUIRED,isolation = Isolation.DEFAULT)
    @Override
    public Book getBookInfoByBookId(int bookId) {
        Book book = bookMapper.getBookById(bookId);
            book.setStyleName(bookStyleMapper.getBookStyle(book.getBookStyleId()).getBookStyleName());
            book.setLabels(bookLabelRelationMapper.getLabelsOfBook(bookId));
            book.setReaderNum(readerBookRelationMapper.countReader(bookId));
            book.setWordsNum(bookMapper.getWordsNumOfBook(bookId));
            book.setClickTimes(bookMapper.getClickNum(bookId));
            book.setWriter(writerMapper.getWriter(book.getBookWriterId()));
        return book;
    }
    @Override
    public int getClickTimes(int bookId) {
        return bookMapper.getClickNum(bookId);
    }

    @Override
    public int getRecommendTickets(int bookId) {
        return bookMapper.getBookById(bookId).getBookRecommendTicket();
    }

    @Override
    public int getWordsNumOfBook(int bookId) {
        return bookMapper.getWordsNumOfBook(bookId);
    }

    @Override
    public int calculateBookPrice(int bookId) {
        return (int)((bookMapper.getWordsNumOfBook(bookId)/1000.0)*thousandWordsPrice);
    }
    @Override
    public List<Chapter> getMenuOfBook(int bookId) {
        return chapterMapper.getChaptersByBookId(bookId);
    }

    @Override
    public Book getBookByName(String bookName) {
        return bookMapper.getBookByName(bookName);
    }

    @Override
    public List<Book> getBooksByName(String name) {
        List<Book> basicInfo = bookMapper.getBooksByName(name);
        List<Book> books = new ArrayList<>();
        for (Book book : basicInfo){
            books.add(getBookInfoByBookId(book.getBookId()));
        }
        return books;
    }


    @Override
    public List<Book> getBooksInfoByIds(List<Integer> booksIds){
        List<Book> books = new ArrayList<Book>();
        if (booksIds!=null){
            for (Integer bookId :booksIds){
                books.add(getBookInfoByBookId(bookId));
            }
        }

        return books;
    }

    @Override
    public Integer getFirstChapterIdOfBook(int bookId) {
        return chapterMapper.getFirstChapterIdOf(bookId);
    }

    @Override
    public List<Book> getBooksByLabelId(int labelId) {
        List<Book> books = bookMapper.getBooksByLabelId(labelId);
        for (Book book : books){
            book = getBookInfoByBookId(book.getBookId());
        }
        return books;
    }

    @Override
    public Book getBasicInfoOfBook(int bookId) {
        Book book = bookMapper.getBookById(bookId);
        book.setWriter(writerMapper.getWriter(book.getBookWriterId()));
        book.setClickTimes(bookMapper.getClickNum(bookId));
        book.setStyleName(bookStyleMapper.getBookStyle(book.getBookStyleId()).getBookStyleName());
        return book;
    }

    @Override
    public List<Book> getBasicInfoOfBooks(List<Integer> bookIds) {
        List<Book> books = new ArrayList<Book>();
        for (Integer bookId : bookIds){
            books.add(getBasicInfoOfBook(bookId));
        }
        return books;
    }


    @Override
    public BookStyle getBookStyle(int styleId) {
        return bookStyleMapper.getBookStyle(styleId);
    }

    @Override
    public boolean alterBook(Book book) {
        return bookMapper.alter(book);
    }

    @Override
    public List<Book> getBookByWriterId(int writerId) {
        return bookMapper.getBookByWriterId(writerId);
    }

    @Override
    public Book getBook(int writerId, int bookId) {
        return bookMapper.getBook(writerId,bookId);
    }

    @Override
    public List<BookStyle> getStyle(int styleId){

        return bookStyleMapper.getStyle(styleId);

    }

    @Override

    public List<BookStyle> getMaleFirstLabel() {
        return bookStyleMapper.getMaleFirstLabel();
    }

    @Override
    public List<BookStyle> getFemaleFirstLabel() {
        return bookStyleMapper.getFemaleFirstLabel();
    }

    @Override
    public BookStyle getBookStyleByName(String styleName) {
        return bookStyleMapper.getBookStyleByName(styleName);
    }

    @Override

    public Boolean isBookNameExit(String name) {
            if(bookMapper.getBookByName(name)!=null){
                return true;
            }
        return false;
    }

    @Override
    public BookStatus selectBookStatus(Book book) {
        return bookStatusMapper.getBookStatu(book.getBookStatuId());
    }


    @Override

    public List<Book> queryBooksOfMan() {
        return getBooksInfoByIds(bookMapper.queryBooksOfMan());
    }

    @Override
    public List<Book> queryBooksOfWoman() {
        return getBooksInfoByIds(bookMapper.queryBooksOfWoman());
    }

    @Override
    public boolean isFinalChapter(int chapterId) {
        Chapter chapter = chapterMapper.getChapterById(chapterId);
        int bookId = chapter.getChapterBookId();

        System.out.println("\n"+"?????????????????????"+chapterMapper.getMaxChapterNumOfBook(bookId)+"\n");

        return chapterMapper.getMaxChapterNumOfBook(bookId) == chapter.getChapterNum();
    }

    @Override
    public List<Book> getBooksByBookStyle(int bookStyleId) {
       List<Integer> books = bookMapper.getBooksByStyleId(bookStyleId);
       List<Book> booksInfo = new ArrayList<Book>();
       if(books.size()!=0){
           for (Integer bookId :books){
               booksInfo.add(getBookInfoByBookId(bookId));
           }
       }
        return booksInfo;
    }

    public List<Book> showBooksPrepared(List<Book> bookList){
        if (bookList!=null){
            Collections.shuffle(bookList);//????????????????????????????????????
            int i = 1;
            for (Book b : bookList) {
                b.setReaderNum(i);
                i++;
            }
        }

        return bookList;
    }

    public List<BookStyle> getStylesNameLike(String styleName){
        return bookStyleMapper.getStylesNameLike(styleName);
    }

    @Override
    public List<BookLabel> getlabelsNameLike(String typing) {
        return bookLabelMapper.getlabelsNameLike(typing);
    }

    @Override
    public List<Book> getByLabelNameOrStyleName(String keyWord) {
        List<Integer> ids = bookLabelMapper.getByLabelNameOrStyleName(keyWord);
        List<Integer> secondIds = new ArrayList<>(ids);
        for (Integer id : ids){
            List<BookStyle> secondStyles =  bookStyleMapper.getStyle(id);
            for (BookStyle secondStyle : secondStyles) {
                secondIds.add(secondStyle.getBookStyleId());
            }
            if(id > 10000){
                secondIds.add(id);
            }
        }
        List<Book> booksTry = new ArrayList<Book>();
        for(Integer id:secondIds){
            List<Integer> styleBookIds = new ArrayList<>();
            for(Book book : bookMapper.getBooksByLabelId(id)){
                styleBookIds.add(book.getBookId());
            }
            booksTry.addAll(getBooksInfoByIds(styleBookIds));
            for (int bookId : bookMapper.getBooksByStyleId(id)){
                booksTry.add(getBookInfoByBookId(bookId));
            }
        }
        return booksTry;
    }

    @Override
    public boolean downShelfBook(Integer bookId) {
        Book book = bookMapper.getBookById(bookId);
        book.setBookDownShelf(true);
        return bookMapper.alter(book);/*??????????????????true*/
    }

    @Override
    public boolean reUpToShelfBook(Integer bookId) {
        Book book = bookMapper.getBookById(bookId);
        book.setBookDownShelf(Boolean.FALSE);
        return bookMapper.alter(book);/*??????????????????true*/
    }

    @Override
    public List<Book> getBooksByNameForManager(String keyWord) {
        List<Book> basicInfo = bookMapper.getBooksByNameForManager(keyWord);
        List<Book> books = new ArrayList<>();
        for (Book book : basicInfo){
            books.add(getBookInfoByBookId(book.getBookId()));
        }
        return books;
    }

    @Override
    public List<Book> getBookByWriterNameLike(String typing) {
        return bookMapper.getBookByWriterNameLike(typing);
    }

    @Override
    public List<Book> getAllDownShelfBooks() {
        return bookMapper.getAllDownShelfBooks();
    }

    @Override
    public List<Book> queryByKeyWord(String keyWord) {
        List<Book> books = new ArrayList<>();
        List<Book> writerBooks = new ArrayList<>();
        if (keyWord != null || !keyWord.trim().equals("")) {
            books = getBooksByName(keyWord);
            writerBooks = getBookByWriterNameLike(keyWord);
        }
        List<Book> booksByLabel = new ArrayList<>();
        if (books.size() == 0)
            booksByLabel = getByLabelNameOrStyleName(keyWord);
        books.addAll(booksByLabel);
        books.addAll(writerBooks);

        return books;
    }

    @Override
    public int getBookIdByName(String bookName) {
        return bookMapper.getBookIdByName(bookName);
    }

    @Override
    public List<WriterBook> getBookByWriterId2(int writerId) {
        return bookMapper.getBookByWriterId2(writerId);
    }

    @Override
    public List<Chapter> getAllFreeChapters(int bookId) {
        return chapterMapper.getFreeChapters(bookId);
    }

    @Override
    public List<Chapter> getBoughtChapters(Integer bookId, Integer readerId) {
        return chapterMapper.getBoughtChapters(bookId,readerId);
    }

    @Override
    public BookStyle getBookStyleById(int id) {
        return bookStyleMapper.getBookStyle(id);
    }

    @Override
    public BookStyle getFirstStyle(int styleId) {
        return bookStyleMapper.getFirstStyle(styleId);
    }

    @Override
    public boolean updatePic(int bookId, String imgfile) {
        return bookMapper.updatePic(bookId, imgfile);
    }

}
