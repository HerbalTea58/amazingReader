package com.amazingReader.control.Chen;

import com.amazingReader.entity.Book;
import com.amazingReader.entity.BookStyle;
import com.amazingReader.service.Interface.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@RequestMapping("/manager")
@RestController
public class BookManageControl {
    @Autowired
    private ManagerService managerService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private ChapterService chapterService;
    @Autowired
    private ReportService reportService;
    @Autowired
    private ReaderService readerService;
    @Autowired
    private BookService bookService;
    @RequestMapping("/downShelfBook.action")
    public boolean downShelfBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Integer reportId = Integer.parseInt(request.getParameter("reportId")==null?"0":request.getParameter("reportId"));
            Integer bookId = Integer.parseInt(request.getParameter("bookId"));
            if(reportId != 0){
                return reportService.downShelfReportBook(bookId,reportId);
            }else{
                return bookService.downShelfBook(bookId);
            }
        }catch (Exception e){
            return false;
        }
    }

    @RequestMapping("/downShelfChapter.action")
    public boolean downShelfChapter(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Integer reportId = Integer.parseInt(request.getParameter("reportId")==null?"0":request.getParameter("reportId"));
            Integer chapterId = Integer.parseInt(request.getParameter("chapterId"));
            if(reportId != 0){
                return reportService.downShelfReportChapter(reportId,chapterId);
            }
        }catch (Exception e){
            return false;
        }
        return false;
    }

    @RequestMapping("/reUpToShelfBook.action")
    public boolean reUpToShelfBook(HttpServletRequest request,HttpServletResponse response){
        try {
            Integer bookId = Integer.parseInt(request.getParameter("bookId"));
            return bookService.reUpToShelfBook(bookId);
        }catch (Exception e){
            return false;
        }
    }


    @RequestMapping("/bookManage.action")
    public void bookManagerHomePage(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        //?????????????????????????????????
        String keyWord = request.getParameter("keyWord")==null?"??????":request.getParameter("keyWord");
        List<Book> books = bookService.getBooksByNameForManager(keyWord);
        List<Book> booksByLabel;
        booksByLabel = bookService.getByLabelNameOrStyleName(keyWord);
        books.addAll(booksByLabel);
        request.setAttribute("books",books);
        /**
         * ??????????????????
         */
        List<BookStyle> styles = bookService.getStylesNameLike("");
        //?????????????????????????????????
        List<BookStyle> womanStyles=bookService.getFemaleFirstLabel();
        request.setAttribute("FemaleList",womanStyles);
        //??????
        List<BookStyle> manStyles=bookService.getMaleFirstLabel();
        request.setAttribute("MaleList",manStyles);
        request.setAttribute("styles",styles);

        request.getRequestDispatcher("/JSP/manageBook.jsp").forward(request,response);
    }

    @RequestMapping("/bookDownShelf.action")
    public void manageDownShelf(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        //????????????????????????
        List<Book> downShelfBooks=new ArrayList<Book>();
        downShelfBooks=bookService.getAllDownShelfBooks();
        request.setAttribute("downShelfBooks",downShelfBooks);
        request.getRequestDispatcher("/JSP/manageUpShelfBook.jsp").forward(request,response);

    }
}
