package com.amazingReader.control.Gao;

import com.amazingReader.entity.Book;
import com.amazingReader.entity.BookStyle;
import com.amazingReader.entity.Reader;
import com.amazingReader.entity.ReaderRecommendTicketsRecord;
import com.amazingReader.service.Interface.BookService;
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

@RequestMapping("/reader")
@Controller
public class ReaderRecommendTicketsControl {
    @Autowired
    private ReaderService readerService;
    @Autowired
    private BookService bookService;
    @RequestMapping("/readerRecommendTicketsRecord.action")
    public void getReaderRecommendTicketsRecord(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Reader reader1= (Reader) request.getSession().getAttribute("reader");
        Reader reader=new Reader();
        if (reader1!=null) {
            reader = readerService.getReaderInfo(reader1.getReaderId());
        }
        List<ReaderRecommendTicketsRecord> readerRecommendTicketsRecordList=readerService.getRecordsByReaderId(reader.getReaderId());
        List<ReaderRecommendTicketsRecord> readerRecommendTicketsRecordListWoman=new ArrayList<>();
        List<ReaderRecommendTicketsRecord> readerRecommendTicketsRecordListMan=new ArrayList<>();
        int womanNum=0;
        int manNum=0;
        for (ReaderRecommendTicketsRecord readerRecommendTicketsRecord:readerRecommendTicketsRecordList){
            Book book=bookService.getBookInfoByBookId(readerRecommendTicketsRecord.getBookId());
            readerRecommendTicketsRecord.setBook(book);
            String bookStyleId=book.getBookStyleId()+"";
            if (bookStyleId.startsWith("10")){
                readerRecommendTicketsRecordListWoman.add(readerRecommendTicketsRecord);
            }else {
                readerRecommendTicketsRecordListMan.add(readerRecommendTicketsRecord);
            }
        }
       for (ReaderRecommendTicketsRecord readerRecommendTicketsRecord:readerRecommendTicketsRecordListWoman){
            int num=readerService.getUsedRecommendTicketsNumByBookId(readerRecommendTicketsRecord.getBookId());
            womanNum+=num;
       }
       for (ReaderRecommendTicketsRecord readerRecommendTicketsRecord:readerRecommendTicketsRecordListMan){
           int num=readerService.getUsedRecommendTicketsNumByBookId(readerRecommendTicketsRecord.getBookId());
           manNum+=num;
       }
        request.setAttribute("reader",reader);
        request.setAttribute("womanNum",womanNum);
        request.setAttribute("manNum",manNum);
        request.setAttribute("readerRecommendTicketsRecordList",readerRecommendTicketsRecordList);
        request.getRequestDispatcher("/JSP/recommendtickets.jsp").forward(request,response);

    }
}
