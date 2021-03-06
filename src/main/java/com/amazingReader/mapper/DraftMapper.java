package com.amazingReader.mapper;

import com.amazingReader.entity.Chapter;
import com.amazingReader.entity.Draft;

import java.util.List;

public interface DraftMapper {
    int getMaxDraftNumOfBook(int bookId);

    List<Draft> getDraftByBookId(int bookId);

    List<Draft> getDraftByBookIdForDelete(int bookId);

    boolean addDraft(Draft draft);

    Draft getDraftByBookIdAndDraftNum(int bookId, int draftNum);

    boolean updateDraft(Draft draft);

    boolean updateDraftNum(int newNum, int oldNum, int bookId);

    boolean deleteDraft(int num, int bookId);

    boolean reDraft(int num, int  bookId);

    List<Chapter> getChapters(int bookId);

    boolean deleteDraftReal(int num, int bookId);

    boolean upDraft(int num, int bookId);
}
