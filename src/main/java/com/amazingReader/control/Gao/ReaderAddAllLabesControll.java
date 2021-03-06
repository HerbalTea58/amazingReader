package com.amazingReader.control.Gao;

import com.amazingReader.entity.BookStyle;
import com.amazingReader.entity.Reader;
import com.amazingReader.entity.ReaderHobbyRelation;
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
import java.util.Iterator;
import java.util.List;

@RequestMapping("/reader")
@Controller
public class ReaderAddAllLabesControll {
    @Autowired
    private ReaderService readerService;
    @Autowired
    private BookService bookService;
    @RequestMapping("/addReaderLabels.action")
    public void getAllLabels(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Reader reader1= (Reader) request.getSession().getAttribute("reader");
        Reader reader=new Reader();
        if (reader1!=null) {
            reader = readerService.getReaderInfo(reader1.getReaderId());
        }
        List<ReaderHobbyRelation> readerHobbyRelationList=readerService.getReaderHobby(reader);
        List<BookStyle> bookStyleList2=readerService.getAllBookStyle();
        System.out.println(bookStyleList2.size());
        for (ReaderHobbyRelation readerHobbyRelation:readerHobbyRelationList){
            BookStyle b=bookService.getBookStyle(readerHobbyRelation.getHobbyLabelId());
            Iterator iterator=bookStyleList2.iterator();
            while (iterator.hasNext()){
                BookStyle bookStyle= (BookStyle) iterator.next();
                if (bookStyle.getBookStyleName().trim().equals(b.getBookStyleName().trim())){
                    iterator.remove();
                }

            }
        }
        System.out.println(bookStyleList2.size());
        request.setAttribute("bookStyleList",bookStyleList2);
        request.getRequestDispatcher("/JSP/readerAddLovesChoose.jsp").forward(request,response);
    }
}
