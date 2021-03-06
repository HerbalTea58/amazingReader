package com.amazingReader.control.Gao;

import com.amazingReader.entity.*;
import com.amazingReader.service.Interface.BookService;
import com.amazingReader.service.Interface.RankingListService;
import com.amazingReader.service.Interface.ReaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@RequestMapping("/person")
@Controller
public class PersonalControl {
    @Autowired
    private ReaderService readerService;
    @Autowired
    private BookService bookService;
    @Autowired
    private RankingListService rankingListService;
    @RequestMapping("/personal.action")
    public  void getReaderInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
           Reader reader = (Reader) request.getSession().getAttribute("reader");
          List<ReaderBookRelation> readerBookRelationList =  readerService.getByReaderId(reader.getReaderId());
          List<Book> booksByCommend=rankingListService.queryBookForRecommend();
          Statu  statu=readerService.get(reader.getReaderStatuId());
          int readerLevel=readerService.getReaderLevel(reader.getReaderId());
          if (reader!=null){
            List<Integer> lists=readerService.readerLoveBookStyleIds(reader.getReaderId());
            List<Book> bookList1=new ArrayList<Book>();
            for (int i:lists){
                if (bookService.getBooksByBookStyle(i).size()!=0){
                    for (Book book : bookService.getBooksByBookStyle(i)){
                        if(!bookList1.contains(book)){
                            bookList1.add(book);
                        }
                    }
                }
            }
            int count=bookList1.size();
            for (Book b:booksByCommend){

                if(!bookList1.contains(b)){
                    bookList1.add(b);
                    count++;
                }
                if (count>5){
                    break;
                }
            }
            bookList1=bookService.showBooksPrepared(bookList1);//?????????????????????????????????readerNum
             request.setAttribute("reader",reader);
            request.setAttribute("bookList1",bookList1);
            request.setAttribute("statu",statu);
            request.setAttribute("readerBookRelation",readerBookRelationList.size());
            request.setAttribute("readerLevel",readerLevel);
            request.getRequestDispatcher("/JSP/personal.jsp").forward(request,response);
        }
    }
    @RequestMapping("/Otherpersonal.action")
    public  void getOtherReaderInfo(int readerId,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Reader reader = readerService.getReaderInfo(readerId);
        List<ReaderBookRelation> readerBookRelationList =  readerService.getByReaderId(readerId);
        List<Book> booksByCommend=rankingListService.queryBookForRecommend();
        Statu  statu=readerService.get(reader.getReaderStatuId());
        int readerLevel=readerService.getReaderLevel(reader.getReaderId());
        if (reader!=null){
            List<Integer> lists=readerService.readerLoveBookStyleIds(reader.getReaderId());
            List<Book> bookList1=new ArrayList<Book>();
            for (int i:lists){
                if (bookService.getBooksByBookStyle(i).size()!=0){
                    for (Book book : bookService.getBooksByBookStyle(i)){
                        if(!bookList1.contains(book)){
                            bookList1.add(book);
                        }
                    }
                }
            }
            int count=bookList1.size();
            for (Book b:booksByCommend){

                if(!bookList1.contains(b)){
                    bookList1.add(b);
                    count++;
                }
                if (count>5){
                    break;
                }
            }
            bookList1=bookService.showBooksPrepared(bookList1);//?????????????????????????????????readerNum
            request.setAttribute("reader",reader);
            request.setAttribute("bookList1",bookList1);
            request.setAttribute("statu",statu);
            request.setAttribute("readerBookRelation",readerBookRelationList.size());
            request.setAttribute("readerLevel",readerLevel);
            request.getRequestDispatcher("/JSP/otherpersonal.jsp").forward(request,response);
        }
    }

}
