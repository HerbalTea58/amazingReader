package com.amazingReader.control.Chen;

import com.amazingReader.entity.Book;
import com.amazingReader.service.Interface.BookService;
import com.amazingReader.service.Interface.RankingListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.List;

@RequestMapping("/manChannel")
@Controller
public class ManChannelControl {
    @Autowired
    private RankingListService rankingListService;
    @Autowired
    private BookService bookService;

    @RequestMapping("/detailInfo.action")
    public void detailInfo(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
        //滚动推荐榜
        List<Book> bookForHotOfMan = rankingListService.queryBookForHotOfMan();
        if (bookForHotOfMan.size() >= 15) {
            request.setAttribute("stlyeBook", bookForHotOfMan.subList(0,14));
        } else {
            request.setAttribute("stlyeBook", bookForHotOfMan);
        }
        //收入榜
        List<Book> bookForIncomeOfMan = rankingListService.queryBookForIncomeOfMan();
        if (bookForIncomeOfMan.size() >= 10) {
            request.setAttribute("incomeBooks", bookForIncomeOfMan.subList(0, 9));
        } else {
            request.setAttribute("incomeBooks", bookForIncomeOfMan);
        }
        List<Book> fakeBooks = bookService.queryBooksOfMan();
        fakeBooks = bookService.queryBooksOfMan();
        Collections.shuffle(fakeBooks);
        request.setAttribute("fakeBooks",fakeBooks);

        request.getRequestDispatcher("/JSP/manChannel.jsp").forward(request,response);


    }
}
