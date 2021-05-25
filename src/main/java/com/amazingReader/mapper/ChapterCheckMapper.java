package com.amazingReader.mapper;

import com.amazingReader.entity.ChapterCheck;
import com.amazingReader.entity.Writer;

import java.util.List;

public interface ChapterCheckMapper {
    ChapterCheck getChapterCheck(Integer chapterNum, Integer bookId);

    List<Writer> getAllInfoOfWriterAndToCheckChapters();

    void removeChapterCheck(Integer chapterNum, Integer bookId);

    boolean add(ChapterCheck chapterCheck);
}