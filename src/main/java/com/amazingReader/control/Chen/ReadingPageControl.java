package com.amazingReader.control.Chen;

import com.amazingReader.entity.*;
import com.amazingReader.entity.utilEntity.ReadingPageInfo;
import com.amazingReader.service.Interface.*;
import com.iflytek.cloud.speech.SpeechConstant;
import com.iflytek.cloud.speech.SpeechUtility;
import com.iflytek.cloud.speech.SpeechRecognizer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.List;


@RequestMapping("/reader")
@RestController
public class ReadingPageControl {
    @Autowired
    private ReaderService readerService;
    @Autowired
    private BookService bookService;
    @Autowired
    private WriterService writerService;
    @Autowired
    private ChapterService chapterService;
    @Autowired
    private VisitorService visitorService;



    /**
     *
     * @param request
     * @param response
     */
    @RequestMapping("/readChapter.action")
    public void readChapter(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取传入的章节号
        Integer chapterId = Integer.parseInt(request.getParameter("chapterId"));
        //获取当前读者
        Reader reader= (Reader)request.getSession().getAttribute("reader");

        //游客获取章节内容
        Chapter chapter = null;
        if(reader == null){
            chapter = visitorService.read(chapterId).getChapter();
        }


        // 登录用户获取章节内容
        Integer readerId = null;
        if(reader != null){
            reader = readerService.getReaderInfo(reader.getReaderId());
            request.getSession().setAttribute("reader",reader);
            readerId = reader.getReaderId();
            chapter = readerService.read(chapterId,readerId);
        }

        //获取书籍信息
        Book book = bookService.getBookInfoByChapterId(chapterId);

        //获取作者信息
        Writer writer = writerService.getWriterInfo(book.getBookWriterId());
        //如果不是最后一章，获取下一章
        System.out.println("当前请求章节："+chapter.getChapterNum()+",最后一章？"+bookService.isFinalChapter(chapter.getChapterId()));
        if(!bookService.isFinalChapter(chapter.getChapterId())){
            Chapter nextChapter = chapterService.getChapterByChapterNumAndBookId(chapter.getChapterNum()+1,chapter.getChapterBookId());
            //当前已登录
            if(reader != null) {
                //章节不免费，提示用户购买
                boolean flag = readerService.isReaderCanRead(chapterService.getNextChapterId(chapterId), readerId);
                if (!flag) {
                    nextChapter.setChapterContent(null);
                }
            }else {
                //如果章节不免费，不让游客看
                if (!chapter.getChapterStatu()){
                    nextChapter.setChapterContent(null);
                }
            }
//            System.out.println(nextChapter);
            request.setAttribute("nextChapter",nextChapter);

//            System.out.println("拿到了下一章:"+nextChapter);

        }
        List<Chapter> boughtChapters = new ArrayList<>();
        //如果不是第一章，获取前一章
        if(chapter.getChapterNum() != 1) {
            Chapter preChapter = chapterService.getChapterByChapterNumAndBookId(chapter.getChapterNum()-1,chapter.getChapterBookId());
            //当前已登录

            if(reader != null) {
                //章节不免费，提示用户购买
                boolean flag = readerService.isReaderCanRead(chapterService.getPreChapterId(chapterId), readerId);
                boughtChapters = bookService.getBoughtChapters(chapter.getChapterBookId(),readerId);
                for(Chapter chapter1 : boughtChapters){
                    chapter1.setBought(true);
                    chapter1.setChapterContent("");
                }
                if (!flag) {
                    preChapter.setChapterContent(null);
                }
            }else {
                //如果章节不免费，不让游客看
                if (!chapter.getChapterStatu()){
                    preChapter.setChapterContent(null);
                }
            }
            request.setAttribute("preChapter", preChapter);

//            System.out.println("拿到了上一章:"+preChapter);
        }

        //获取书籍目录
        List<Chapter> menu = bookService.getMenuOfBook(book.getBookId());

        boughtChapters.addAll(menu);

        boughtChapters = new ArrayList<>(new LinkedHashSet<>(boughtChapters));

        //当前已登录
        if(reader != null) {
            //章节不免费，提示用户购买
            boolean flag = readerService.isReaderCanRead(chapterId, readerId);
            if (!flag) {
                chapter.setChapterContent(null);
            }
        }else {
            //如果章节不免费，不让游客看
            if (!chapter.getChapterStatu()){
                chapter.setChapterContent(null);
            }
        }
        ReadingPageInfo readingPageInfo = new ReadingPageInfo();
        readingPageInfo.setBook(book);
        readingPageInfo.setChapter(chapter);
        readingPageInfo.setMenu(boughtChapters);
        readingPageInfo.setWriter(writer);

        request.setAttribute("info",readingPageInfo);

        request.getRequestDispatcher("/JSP/readingPage.jsp").forward(request,response);
    }
    @RequestMapping("/recharge.action")
    public void recharge(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        Integer rechargePrice = request.getParameter("price")==null?0:Integer.parseInt(request.getParameter("price"));
        Reader reader = (Reader)request.getSession().getAttribute("reader");
        Integer balance = readerService.recharge(rechargePrice,reader.getReaderId());
        request.setAttribute("balance",balance);
        request.getRequestDispatcher("/JSP/rechargeDone.jsp").forward(request,response);
    }

    @RequestMapping("/addToShelf.action")
    public boolean addToShelf(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        Integer bookId = Integer.parseInt(request.getParameter("bookId"));
        Integer readerId = ((Reader)request.getSession().getAttribute("reader")).getReaderId();
        return readerService.addBookToBookShelf(bookId,readerId);
    }
    @RequestMapping("/setReaderDeflaultReadingColor.action")
    public boolean setReaderDeflaultReadingColor(HttpServletRequest request){
        String defaultColor = request.getParameter("color");

        Reader reader= (Reader)request.getSession().getAttribute("reader");

        Boolean flag = false;
        if(reader != null){
            reader.setReaderColor(defaultColor);
            flag = readerService.alterInfo(reader);
        }else{
            flag = true;
        }
        request.getSession().setAttribute("color",defaultColor);
        return flag;

    }

    @RequestMapping("/recommentTieckts.action")
    public boolean recommentTieckts(HttpServletRequest request ,HttpServletResponse response){
        Integer num = Integer.parseInt(request.getParameter("num"));
        Integer bookId = Integer.parseInt(request.getParameter("bookId"));
        Reader reader = (Reader) request.getSession().getAttribute("reader");
        /*if(num <= reader.getReaderRecommendTicket()){
            Book book = bookService.getBookInfoByBookId(bookId);
            book.setBookRecommendTicket(book.getBookRecommendTicket()+num);
            bookService.alterBook(book);
            reader.setReaderRecommendTicket(reader.getReaderRecommendTicket()-num);
            request.getSession().setAttribute("reader",reader);
            readerService.alterInfo(reader);
            return true;
        }*/
        return readerService.recommentBook(num,reader.getReaderId(),bookId);
    }
    @RequestMapping("/read.action")
    public void read(HttpServletRequest request){
        chapterService.read();
    }

    @RequestMapping("/reportChapter.action")
    public void reportChapter(HttpServletRequest request,HttpServletResponse response){
        Integer chapterId = Integer.parseInt(request.getParameter("chapterId"));
        Integer typeId = Integer.parseInt(request.getParameter("typeId"));

        Reader reader = (Reader) request.getSession().getAttribute("reader");

        ReportChapter reportChapter = new ReportChapter();
            reportChapter.setReportStatuId(1);
            reportChapter.setReaderId(reader.getReaderId());
            reportChapter.setChapterId(chapterId);
            reportChapter.setReportTime(new Date());
            reportChapter.setReportTypeId(typeId);
            reportChapter.setReportManagerId(1);/*待修改随机分配管理员*/
        readerService.reportChapter(reportChapter);
    }


}
