package com.amazingReader.control.Gao;

import com.amazingReader.entity.*;
import com.amazingReader.service.Interface.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RequestMapping("/bookshelf")
@Controller
public class BookShelfControl {
    @Autowired
    private ReaderService readerService;
    @Autowired
    private WriterService writerService;
    @Autowired
    private BookService bookService;
    @Autowired
    private ChapterService chapterService;
    @Autowired
    private RankingListService rankingListService;
    @RequestMapping("/searchbookshelf.action")
    public void getBookShelfBooks(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         Reader reader1= (Reader) request.getSession().getAttribute("reader");
        Reader reader=new Reader();
         if (reader1!=null) {
              reader = readerService.getReaderInfo(reader1.getReaderId());
         }
         List<ReaderBookRelation> bookList=readerService.getByReaderId(reader.getReaderId());
         List<Bookshelf> bookList1=new ArrayList<Bookshelf>();
         List<Book> bookList2=new ArrayList<Book>();
            for (ReaderBookRelation readerBookRelation : bookList) {
                Chapter maxchapter=new Chapter();
                Chapter readingChapter=new Chapter();
                readingChapter.setChapterNum(0);
                Book book = bookService.getBookInfoByBookId(readerBookRelation.getReaderBookBookId());
                System.out.println(book.getBookDownShelf());
                BookStyle bookStyle= bookService.getBookStyle(book.getBookStyleId());
                Writer writer = writerService.getWriterInfo(book.getBookWriterId());
                int maxChapterNum = chapterService.getMaxChapterNumOfBook(book.getBookId());
                if (maxChapterNum!=0) {
                    maxchapter = chapterService.getChapterByChapterNumAndBookId(maxChapterNum,book.getBookId());
                    int readingChapterNum = readerBookRelation.getReaderBookReadingChapterNum();
                    readingChapter = chapterService.getChapterByChapterNumAndBookId(readingChapterNum,book.getBookId());
                }
                String update=null;
                java.sql.Date readingChapterTime=new java.sql.Date(readingChapter.getChapterRefreshTime().getTime());
                java.sql.Date maxChapterTime=new java.sql.Date(maxchapter.getChapterRefreshTime().getTime());
                List<Chapter> chapterList=chapterService.updateOrNot(readingChapterTime,maxChapterTime,book.getBookId());
                if(chapterList.size()>0){
                    update="?????????";
                }
                String downShelfOrNot=null;
                if(book.getBookDownShelf()){
                        downShelfOrNot="?????????";
                }
                Bookshelf bookshelf = new Bookshelf();
                bookshelf.setWriter(writer);
                bookshelf.setBook(book);
                bookshelf.setBookStyle(bookStyle);
                bookshelf.setMaxchapter(maxchapter);
                bookshelf.setReaderBookRelation(readerBookRelation);
                bookshelf.setReadingChapter(readingChapter);
                bookshelf.setUpdateOrNot(update);
                bookshelf.setDownShelfOrNot(downShelfOrNot);
                bookList1.add(bookshelf);
            }
            if (reader.getReaderSex()){
                //???????????????
                bookList2=rankingListService.queryBookForCollectOfMan();
            }else {
                bookList2=rankingListService.queryBookForCollectOfWoman();
            }

            request.setAttribute("bookList2",bookList2);
            request.setAttribute("reader",reader);
            request.setAttribute("bookList1",bookList1);
            request.setAttribute("booklistsize",bookList.size());
            request.getRequestDispatcher("/JSP/book.jsp").forward(request,response);
    }

}
