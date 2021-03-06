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
import java.util.List;

@RequestMapping("/reader")
@Controller
public class ReaderAddHobbyControl {
    @Autowired
    private ReaderService readerService;
    @Autowired
    private BookService bookService;
    @RequestMapping("/readerAddHobby.action")
    public void getReaderAddHobby(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Reader reader1= (Reader) request.getSession().getAttribute("reader");
        Reader reader=new Reader();
        if (reader1!=null) {
            reader = readerService.getReaderInfo(reader1.getReaderId());
        }
        String labels[]=request.getParameterValues("checkbox");
        if (labels.length>=0){
            for (int i = 0; i < labels.length; i++) {
                ReaderHobbyRelation readerHobbyRelation = new ReaderHobbyRelation();
                readerHobbyRelation.setHobbyReaderId(reader.getReaderId());
                readerHobbyRelation.setHobbyLabelId(Integer.parseInt(labels[i]));
                readerService.addLovesBookStyle(readerHobbyRelation);
            }
        }
        List<ReaderHobbyRelation> readerHobbyRelationList=readerService.getReaderHobby(reader);
        List<BookStyle> bookStyleList=new ArrayList<BookStyle>();
        for(ReaderHobbyRelation readerHobbyRelation:readerHobbyRelationList){
            BookStyle bookStyle=bookService.getBookStyle(readerHobbyRelation.getHobbyLabelId());
            bookStyleList.add(bookStyle);
        }
        request.setAttribute("reader",reader);
        request.setAttribute("bookStyleList1",bookStyleList);
        request.getRequestDispatcher("/JSP/userinformation.jsp").forward(request,response);
    }
    }

