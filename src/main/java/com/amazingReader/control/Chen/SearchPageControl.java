package com.amazingReader.control.Chen;

import com.amazingReader.entity.Book;
import com.amazingReader.service.Interface.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@RequestMapping("/search")
@RestController
public class SearchPageControl {
    @Autowired
    private BookService bookService;

    @RequestMapping("/getByLabel.action")
    public void getByLabel(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Integer labelId = Integer.parseInt(request.getParameter("labelId"));
        List<Book> books = bookService.getBooksByLabelId(labelId);
        request.setAttribute("books",books);
        response.sendRedirect(request.getContextPath()+"/JSP/search.jsp");
    }
}
