package com.amazingReader.service.Impl;

import com.amazingReader.entity.Book;
import com.amazingReader.entity.ReportChapter;
import com.amazingReader.entity.ReportComment;
import com.amazingReader.mapper.*;
import com.amazingReader.service.Interface.ChapterService;
import com.amazingReader.service.Interface.CommentService;
import com.amazingReader.service.Interface.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import sun.management.counter.perf.PerfInstrumentation;

@Service
public class ReportServiceImpl implements ReportService {
    @Autowired
    private CommentMapper commentMapper;
    @Autowired
    private ReportCommentMapper reportCommentMapper;
    @Autowired
    private ReportChapterMapper reportChapterMapper;
    @Autowired
    private ChapterMapper chapterMapper;
    @Autowired
    private BookMapper bookMapper;

    @Override
    public void removeReportComment(int reportId,int commentId) {

        commentMapper.downShelfCommentById(commentId);
        ReportComment reportComment = reportCommentMapper.getById(reportId);
        reportComment.setReportStatuId(5);
        reportComment.setReportSolution("删除评论");
        reportCommentMapper.alter(reportComment);
    }

    @Override
    public void refuseReportComment(int reportId) {
        ReportComment reportComment = reportCommentMapper.getById(reportId);
        reportComment.setReportStatuId(5);
        reportComment.setReportSolution("驳回举报");
        reportCommentMapper.alter(reportComment);
    }

    @Override
    public boolean downShelfReportChapter(int reportId, int chapterId) {
        chapterMapper.removeByChapterId(chapterId);//将该章节置为0,即为章节下架
        ReportChapter reportChapter = reportChapterMapper.getById(reportId);
        if (reportChapter!=null){
            reportChapter.setReportStatuId(5);
            reportChapter.setReportSolution("下架章节");
            reportChapterMapper.alter(reportChapter);
            return true;
        }
        return false;


    }

    @Override
    public void refuseReportChapter(int reportId) {
        ReportChapter reportChapter = reportChapterMapper.getById(reportId);
        reportChapter.setReportStatuId(5);
        reportChapter.setReportSolution("驳回举报");
        reportChapterMapper.alter(reportChapter);
    }
    @Transactional(propagation= Propagation.REQUIRED,isolation = Isolation.DEFAULT)
    @Override
    public boolean downShelfReportBook(Integer bookId,Integer reportId) {
        Book book = bookMapper.getBookById(bookId);
        book.setBookDownShelf(true);
        bookMapper.alter(book);/*修改下架字段true*/
        ReportChapter reportChapter = reportChapterMapper.getById(reportId);
        reportChapter.setReportStatuId(5);
        reportChapter.setReportSolution("下架书籍");
        return reportChapterMapper.alter(reportChapter);/*修改举报处理*/
    }

}
