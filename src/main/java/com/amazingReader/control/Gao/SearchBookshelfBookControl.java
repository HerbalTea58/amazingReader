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

@RequestMapping("/reader")
@Controller
public class SearchBookshelfBookControl {
    @Autowired
    private BookService bookService;
    @Autowired
    private ReaderService readerService;
    @Autowired
    private WriterService writerService;
    @Autowired
    private ChapterService chapterService;

    @RequestMapping("/SearchBookshelf.action")
    public void searchBookShelfBook(String name, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Reader reader1 = (Reader) request.getSession().getAttribute("reader");
        Reader reader=new Reader();
        if (reader1!=null) {
            reader = readerService.getReaderInfo(reader1.getReaderId());
        }
        List<Book> bookList = new ArrayList<Book>();
        List<ReaderBookRelation> readerBookRelationList=new ArrayList<ReaderBookRelation>();
        List<Bookshelf> bookshelfList = new ArrayList<Bookshelf>();
        List<Writer> writerList=writerService.getWritersByName(name);
        if (writerList.size()>0&&writerList!=null) {
            for (Writer writer : writerList) {
                readerBookRelationList = readerService.getBookShelfBooksByWriterName(writer.getWriterNeckName(), reader.getReaderId());
                if (readerBookRelationList.size() > 0) {
                    for (ReaderBookRelation readerBookRelation : readerBookRelationList) {
                        Book book1 = bookService.getBookInfoByBookId(readerBookRelation.getReaderBookBookId());
                        bookList.add(book1);
                    }
                }
            }
        }
        List<Book> bookList1=bookService.getBooksByName(name);
        if (bookList1.size()>0&&bookList1!=null) {
            for (Book bookList11:bookList1) {
                ReaderBookRelation readerBookRelation = readerService.getBookShelfBooksByBookName(bookList11.getBookName(), reader.getReaderId());
                if (readerBookRelation != null) {
                    Book book1 = bookService.getBookInfoByBookId(readerBookRelation.getReaderBookBookId());
                    bookList.add(book1);
                }
            }
        }
        if (bookList.size() > 0) {
            for (Book book1 : bookList) {
                Chapter maxchapter = new Chapter();
                Chapter readingChapter = new Chapter();
                readingChapter.setChapterNum(0);
                BookStyle bookStyle = bookService.getBookStyle(book1.getBookStyleId());
                Writer writer = writerService.getWriterInfo(book1.getBookWriterId());
                int maxChapterNum = chapterService.getMaxChapterNumOfBook(book1.getBookId());
                String downShelf=null;
                String update=null;
                if (maxChapterNum != 0) {
                    maxchapter = chapterService.getChapterByChapterNumAndBookId(maxChapterNum, book1.getBookId());
                    int readingChapterNum = readerService.getChapterNumIfReaderIsReadingBook(book1.getBookId(), reader.getReaderId());
                    if (readingChapterNum!=-1) {
                        readingChapter = chapterService.getChapterByChapterNumAndBookId(readingChapterNum, book1.getBookId());
                    }else {
                        readingChapterNum=1;
                        readingChapter=chapterService.getChapterByChapterNumAndBookId(readingChapterNum,book1.getBookId());
                    }

                    if (book1.getBookDownShelf()){
                        downShelf="?????????";
                    }
                    if (readingChapter!=null) {
                        java.sql.Date dateread = new java.sql.Date(readingChapter.getChapterRefreshTime().getTime());
                        java.sql.Date datemax = new java.sql.Date(maxchapter.getChapterRefreshTime().getTime());
                        if (chapterService.updateOrNot(dateread, datemax, book1.getBookId()).size() > 0) {
                            update = "?????????";
                        }
                    }
                    Bookshelf bookshelf = new Bookshelf();
                    bookshelf.setWriter(writer);
                    bookshelf.setMaxchapter(maxchapter);
                    bookshelf.setReadingChapter(readingChapter);
                    bookshelf.setBookStyle(bookStyle);
                    bookshelf.setBook(book1);
                    bookshelf.setDownShelfOrNot(downShelf);
                    bookshelf.setUpdateOrNot(update);
                    bookshelfList.add(bookshelf);
                }

            }
        }
            request.setAttribute("bookshelfList", bookshelfList);
            request.setAttribute("bookshelfListsize", bookList.size());
            request.setAttribute("name", name);
            request.setAttribute("reader",reader);
            request.getRequestDispatcher("/JSP/SearchBookShelf.jsp").forward(request, response);
    }
}
