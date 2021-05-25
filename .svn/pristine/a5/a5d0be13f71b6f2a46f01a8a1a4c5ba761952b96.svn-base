package com.amazingReader.control;

import com.amazingReader.entity.Book;
import com.amazingReader.entity.BookStyle;
import com.amazingReader.service.Interface.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@RequestMapping("/manager")
@RestController
public class ManageBookControl {

    @Autowired
    private BookService bookService;
    @RequestMapping("/selectStyle.action" )
    public @ResponseBody
    List<BookStyle> selectStyle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int styleId = Integer.parseInt(request.getParameter("styleId"));
        System.out.println("++++++styleID++++++++++"+ styleId+"+++++++++");
        List<BookStyle> bookStyleList = bookService.getStyle(styleId);
        return bookStyleList;
    }

    @RequestMapping("/getBooksByStyleId.action")
    public void getBooksByStyleId(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        String rid=request.getParameter("styleId");
        int id=Integer.parseInt(rid);
        //通过二级类查找出对应的一级类
        BookStyle bookFirstStyle=bookService.getFirstStyle(id);
        request.setAttribute("bookFirstStyle",bookFirstStyle);
        //通过二级类 查找对应书籍
        List<Book> books=bookService.getBooksByBookStyle(id);
        request.setAttribute("bookList",books);
        //返回该二级类
        BookStyle bookStyle=bookService.getBookStyle(id);
        request.setAttribute("style",bookStyle);

        //获得女频书籍的一级类别
        List<BookStyle> womanStyles=bookService.getFemaleFirstLabel();
        request.setAttribute("FemaleList",womanStyles);
        //男频书籍的一级类别
        List<BookStyle> manStyles=bookService.getMaleFirstLabel();
        request.setAttribute("MaleList",manStyles);

        //判断男频还是女频
        if (rid.substring(0,2).equals("11")){//男频
            request.setAttribute("manChannel",1);
        }else {//女频
            request.setAttribute("womanChannel",2);
        }
        request.getRequestDispatcher("/JSP/manageBook.jsp").forward(request,response);


    }


}
