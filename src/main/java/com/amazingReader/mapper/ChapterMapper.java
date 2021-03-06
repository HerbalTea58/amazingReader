package com.amazingReader.mapper;

import com.amazingReader.entity.Book;
import com.amazingReader.entity.Chapter;
import com.amazingReader.entity.utilEntity.WriterData;


import java.sql.Date;
import java.util.List;

public interface ChapterMapper {
    public int getMaxIndex();
    /**
     * 获得某本书的首章ID
     * @param bookID
     * @return thisBook.FirstChapterId
     */
    public int getFirstChapterIdOf(int bookID);
    public boolean add(Chapter chapter);
    public boolean alter(Chapter chapter);
    public boolean remove(Chapter chapter);
    public boolean removeByChapterId(int chapterId);
    public boolean removeByBookId(int bookId);
    public Chapter getChapterById(int chapterId);

    public String  getChapterContent(int chapterId);
    public List<Chapter> getChaptersByBookId(int bookId);

    /**
     * 获得某本书的总阅读数
     * @param chapterId
     * @return
     */
    int getClickNum(int chapterId);
    /**
     * 点击之后点击次数自加
     * @param chapterId
     */
    void click(int chapterId);

    boolean alterDowmShelf(int chapterId, boolean chapterDownShelf);

    int getChapterIdBy(int bookId,int chapterNum);

    int getChapterWordsNum(int chapterId);

    int getMaxChapterNumOfBook(int bookId);
    public  List<Chapter> updateOrNot(Date dateread,Date datemax,int bookId);

    List<WriterData> getChapterByWriter(int writerId);
    public List<WriterData> getChaptersByBookId1(int bookId);

    boolean alterChapter(Chapter chapter);

    List<Chapter> getFreeChapters(int bookId);

    List<Chapter> getBoughtChapters(Integer bookId, Integer readerId);
}