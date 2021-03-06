package com.amazingReader.service.Impl;

import java.util.List;

import com.amazingReader.entity.ChapterAdditionRemarks;
import com.amazingReader.entity.ChapterInfo;
import com.amazingReader.entity.utilEntity.VisitorPermission;
import com.amazingReader.mapper.BookMapper;
import com.amazingReader.mapper.ChapterAdditionRemarksMapper;
import com.amazingReader.mapper.VisitorPermissionMapper;
import org.springframework.beans.factory.annotation.Autowired;

import com.amazingReader.entity.Book;
import com.amazingReader.entity.Chapter;
import com.amazingReader.mapper.ChapterMapper;
import com.amazingReader.service.Interface.VisitorService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class VisiterServiceImpl implements VisitorService{
	@Autowired
	private ChapterMapper chapterMapper;
	@Autowired
	private BookMapper bookMapper;
	@Autowired
	private ChapterAdditionRemarksMapper chapterAdditionRemarksMapper;
	@Autowired
	private VisitorPermissionMapper visitorPermissionMapper;

	@Transactional(propagation= Propagation.REQUIRED,isolation = Isolation.DEFAULT)
	@Override
	public ChapterInfo read(int chapterID) {
		Chapter chapter = chapterMapper.getChapterById(chapterID);
		ChapterAdditionRemarks chapterAdditionRemarks=chapterAdditionRemarksMapper.getChapterAdditionBy(chapter.getChapterId());
		ChapterInfo chapterInfo = new ChapterInfo();
		chapterInfo.setChapter(chapter);
		chapterInfo.setChapterAdditionRemarks(chapterAdditionRemarks);
		return chapterInfo;
	}

	@Transactional(propagation= Propagation.REQUIRED,isolation = Isolation.DEFAULT)
	@Override
	public Chapter readFirstChapterBy(int bookID) {
		int chapterId = chapterMapper.getChapterIdBy(bookID, 1);
		return chapterMapper.getChapterById(chapterId);
	}

	@Override
	public List<Book> getFirstPageBook() {
		List<Book> books = bookMapper.getVisitBookBasic();
		return books;
	}

	public VisitorPermission getPermissionSettingOfReader(int readerId){
		return visitorPermissionMapper.get(readerId);
	}
}
