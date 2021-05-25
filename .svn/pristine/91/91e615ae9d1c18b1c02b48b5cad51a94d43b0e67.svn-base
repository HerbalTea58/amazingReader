package com.amazingReader.service.Impl;

import com.amazingReader.entity.Book;
import com.amazingReader.entity.Writer;
import com.amazingReader.mapper.ChapterCheckMapper;
import com.amazingReader.service.Interface.ToCheckChapterManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ToCheckChapterManageServiceImpl implements ToCheckChapterManageService {
    @Autowired
    private ChapterCheckMapper chapterCheckMapper;
    @Override
    public List<Writer> getAllInfoOfWriterAndToCheckChapters() {
        List<Writer> writerList = chapterCheckMapper.getAllInfoOfWriterAndToCheckChapters();
        for(Writer writer : writerList){
            Integer toCheckChapterNum = 0;
            for(Book book : writer.getBooks()){
                toCheckChapterNum += book.getToCheckChapters().size();
            }
            writer.setToCheckChapterNum(toCheckChapterNum);
        }
        return writerList;
    }
}
