package com.amazingReader.control.Gao;

import com.amazingReader.entity.*;
import com.amazingReader.service.Interface.BookService;
import com.amazingReader.service.Interface.ReaderService;
import com.amazingReader.service.Interface.WriterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.List;

@RequestMapping("/write")
@Controller
public class WriteIntroduceControl {
    @Autowired
    private WriterService writerService;
    @Autowired
    private ReaderService readerService;
    @Autowired
    private BookService bookService;
    @RequestMapping("/writeInformation.action")
    public void getWriteIntroduce(int writerId,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Reader reader1= (Reader) request.getSession().getAttribute("reader");
        Reader reader=new Reader();
        if (reader1!=null) {
            reader = readerService.getReaderInfo(reader1.getReaderId());
        }
        Writer writer=writerService.getWriterInfo(writerId);
        Statu statu=readerService.get(writer.getWriterStatuId());
        List<Book> bookList=bookService.getBookByWriterId(writerId);
        List<BookAndStyle> bookAndStyleList=new ArrayList<BookAndStyle>();
        int total=0;
        for (Book book1:bookList){
            int num=bookService.getWordsNumOfBook(book1.getBookId());
            total+=num;
            BookStyle bookStyle=bookService.getBookStyle(book1.getBookStyleId());
            BookStatus bookStatus=bookService.selectBookStatus(book1);
            BookAndStyle bookAndStyle=new BookAndStyle();
            bookAndStyle.setBook(book1);
            bookAndStyle.setBookStyle(bookStyle);
            bookAndStyle.setBookStatus(bookStatus);
            bookAndStyle.setNum(num);
            bookAndStyleList.add(bookAndStyle);
        }
        request.setAttribute("bookAndStyleList",bookAndStyleList);
        request.setAttribute("bookListlist",bookList.size());
        request.setAttribute("writer",writer);
        request.setAttribute("statu",statu);
        request.setAttribute("reader",reader);
        request.setAttribute("total",total);
        request.getRequestDispatcher("/JSP/writerIntroduce.jsp").forward(request,response);
    }
}
