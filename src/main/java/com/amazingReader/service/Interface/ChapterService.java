package com.amazingReader.service.Interface;

import com.amazingReader.entity.*;

import java.sql.Date;
import java.util.List;

public interface ChapterService {
	/**
	 * 下架章节
	 * @param chapterId
	 */
	void downShelfChapter(int chapterId);

	/**
	 * 计算章节的价格
	 * @param chapter
	 * @return
	 */
	int calculatePriceOfChapter(int chapter);

	/**
	 * 计算章节的价格
	 * @param chapters
	 * @return
	 */
	int calculatePriceOfChapters(List<Integer> chapters);

	/**
	 * 拿的同时修改状态为已阅
	 * @param managerId
	 * @return
	 */
	List<ReportChapter> getAllReportedChapter(int managerId);

	/**
	 * 拿的同时修改状态为已阅
	 * @param managerId
	 * @return
	 */
	List<ReportChapter> getToDealReportedChapter(int managerId);

	Chapter getChapter(int chapterId);

	Chapter getChapterByChapterNumAndBookId(int chapterNum,int bookId);

	Integer getNextChapterId(int chapterId);

	Integer getPreChapterId(int chapterId);
	int getMaxChapterNumOfBook(int bookId);

	void read();
	public  List<Chapter> updateOrNot(Date dateread, Date datemax, int bookId);

	boolean add(Integer chapterNum,Integer bookId);

	void refuseChaper(Integer chapterNum,Integer bookId);

	boolean alterChapter(Integer chapterNum,Integer bookId);

	int getMaxDraftNumOfBook(int bookId);

	int calculatePriceByChapterNum(int wordnum);


	List<Draft> getDraftByBookId(int bookId);

	List<Draft> getDraftByBookIdForDelete(int bookId);

	boolean addDraft(Draft draft);

	Draft getDraftByBookIdAndDraftNum(int bookId, int draftNum);

	boolean updateDraft(Draft draft);

	boolean updateDraftNum(int newNum, int oldNum, int bookId);

	boolean deleteDraft(int num, int bookId);

	boolean reDraft(int num, int  bookId);

	List<Chapter> getChapters(int bookId);

	int getChapterIdBy(int bookId,int chapterNum);

	boolean deleteDraftReal(int num, int bookId);

	boolean alterChapter(Chapter chapter);

	boolean addChapterAddition(ChapterAdditionRemarks chapterAdditionRemarks);

	boolean alterChpaterAddition(ChapterAdditionRemarks chapterAdditionRemarks);

	ChapterAdditionRemarks getChapterAdditionBy(int bookChapterId);

	boolean addChapterCheck(ChapterCheck chapterCheck);

	boolean upDraft(int num, int bookid);

    ChapterCheck getToCheckChapter(Integer bookId, Integer chapterNum);
}
