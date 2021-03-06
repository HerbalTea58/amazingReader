package com.amazingReader.control.Gao;

import com.amazingReader.entity.*;
import com.amazingReader.service.Interface.BookService;
import com.amazingReader.service.Interface.ChapterService;
import com.amazingReader.service.Interface.ReaderService;
import com.amazingReader.service.Interface.WriterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@RequestMapping("/lastReading")
@Controller
public class LastedReadingControl {
    @Autowired
    private ReaderService readerService;
    @Autowired
    private BookService bookService;
    @Autowired
    private ChapterService chapterService;
    @Autowired
    private WriterService writerService;
    @RequestMapping("/lastRead.action")
    public void getLastReading(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Reader reader1= (Reader) request.getSession().getAttribute("reader");
        Reader reader=new Reader();
        if (reader1!=null) {
            reader = readerService.getReaderInfo(reader1.getReaderId());
        }
        List<ReaderReadingRecord> readerReadingRecordList=readerService.getReaderReadingRecord(reader.getReaderId());
        List<Bookshelf> bookshelfList=new ArrayList<Bookshelf>();
        for (ReaderReadingRecord readerReadingRecord:readerReadingRecordList){
            Chapter maxchapter=new Chapter();
            Chapter readingChapter=new Chapter();
            readingChapter.setChapterNum(0);
            Book book=bookService.getBookInfoByBookId(readerReadingRecord.getBookId());
            int maxChapterNum=chapterService.getMaxChapterNumOfBook(book.getBookId());
            BookStyle bookStyle= bookService.getBookStyle(book.getBookStyleId());
            Writer writer = writerService.getWriterInfo(book.getBookWriterId());
            if (maxChapterNum!=0){
                maxchapter=chapterService.getChapterByChapterNumAndBookId(maxChapterNum,book.getBookId());
                int readingChapterNum=readerReadingRecord.getChapterNum();
                readingChapter=chapterService.getChapterByChapterNumAndBookId(readingChapterNum,book.getBookId());
            }
            String downShelf=null;
            if (book.getBookDownShelf()){
                downShelf="?????????";
            }
            java.sql.Date dateread=new java.sql.Date(readingChapter.getChapterRefreshTime().getTime());
            java.sql.Date datemax=new java.sql.Date(maxchapter.getChapterRefreshTime().getTime());
            String update=null;
            if(chapterService.updateOrNot(dateread,datemax,book.getBookId()).size()>0){
                update="?????????";
            }
            Bookshelf bookshelf=new Bookshelf();
            bookshelf.setBook(book);
            bookshelf.setBookStyle(bookStyle);
            bookshelf.setReadingChapter(readingChapter);
            bookshelf.setMaxchapter(maxchapter);
            bookshelf.setWriter(writer);
            bookshelf.setDownShelfOrNot(downShelf);
            bookshelfList.add(bookshelf);
            bookshelf.setUpdateOrNot(update);
        }
            request.setAttribute("reader",reader);
            request.setAttribute("books",bookshelfList);
            request.getRequestDispatcher("/JSP/last.jsp").forward(request,response);
    }


}
