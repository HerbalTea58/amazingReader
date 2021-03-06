package com.amazingReader.control.Chen;

import com.amazingReader.entity.*;
import com.amazingReader.mapper.ScoreLevelInformationMapper;
import com.amazingReader.service.Interface.*;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@RequestMapping("/bookDetail")
@RestController
public class BookDetailPageControl {
    @Autowired
    private ReaderService readerService;
    @Autowired
    private BookService bookService;
    @Autowired
    private WriterService writerService;
    @Autowired
    private ChapterService chapterService;
    @Autowired
    private ScoreService scoreService;
    @Autowired
    private RankingListService rankingListService;

    @RequestMapping("/getBookDetail.action")
    public void getBookDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookId = 0;
        String bookName = null;
        try {
            bookId = Integer.parseInt(request.getParameter("bookId"));
        }catch (Exception e){
            bookName = request.getParameter("bookId");
        }
        Book book = null;
        if(bookName != null) {
            book = bookService.getBookByName(bookName);
            bookId = book.getBookId();
        }

        Reader reader = (Reader)request.getSession().getAttribute("reader");
        if (reader != null && readerService.isReaderReadingBook(bookId,reader.getReaderId())){
            //登录并且看过这本书的，给他正在阅读的章节
            Chapter chapter = chapterService.getChapterByChapterNumAndBookId(
                    readerService.getChapterNumIfReaderIsReadingBook(bookId,reader.getReaderId()),bookId
            );
            request.setAttribute("readingChapter",chapter);
        }else {
            //没看过，或者没登录的，给第一章
            int firstChapterId =  bookService.getFirstChapterIdOfBook(bookId);
            request.setAttribute("firstChapterId",firstChapterId);
        }
        //获取书籍信息
        book = bookService.getBookInfoByBookId(bookId);
        request.setAttribute("book",book);
        //获取作者
        Writer writer = writerService.getWriterInfo(book.getBookWriterId());
        request.setAttribute("writer",writer);

        //获取书籍目录
        List<Chapter> menu = bookService.getMenuOfBook(book.getBookId());
        request.setAttribute("menu",menu);
        if(reader != null) {
            //获取用户等级信息
            Integer readerLevel = readerService.getReaderLevel(reader.getReaderId());
            ScoreLevelInformation scoreLevelInformation = scoreService.getScoreInformationByScoreLevel(readerLevel + 1);
            Integer withUpperLevel = scoreLevelInformation.getScoreNum() - reader.getReaderScore();
            request.setAttribute("readerLevel", readerLevel);
            request.setAttribute("withUpperLevel", withUpperLevel);
        }

        //获取当前书籍作者的获打赏情况
        Integer rewardTimes = writerService.getRewardTimes(book.getBookWriterId());
        request.setAttribute("rewardTimes",rewardTimes);
        PageHelper.startPage(1,6);
        //获取推荐同类书籍
        List<Book> recommendBooks = bookService.getBooksByBookStyle(book.getBookStyleId());
        PageInfo<Book> recommendBooksInfo = new PageInfo<>(recommendBooks);
        request.setAttribute("recommendBooks",recommendBooksInfo);

        //本周强退系列
        PageHelper.startPage(1,15);
        List<Book> forcePushBooks = rankingListService.queryBookForCollect();
        PageInfo<Book> forcePushBooksInfo = new PageInfo<>(forcePushBooks);
        request.setAttribute("forcePushBooks",forcePushBooksInfo);

        request.getRequestDispatcher("/JSP/bookdetail1.jsp").forward(request,response);

    }


    @RequestMapping("/getFirstPageOfBook.action")
    public int getFirstPageOfBook(HttpServletRequest request){
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        Reader reader = (Reader)request.getSession().getAttribute("reader");
        if (readerService.isReaderReadingBook(bookId,reader.getReaderId())){
            return bookService.getFirstChapterIdOfBook(bookId);
        }
        return -1;
    }

}
