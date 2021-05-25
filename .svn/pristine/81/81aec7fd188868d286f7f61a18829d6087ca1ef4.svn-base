package com.amazingReader.control;

import com.amazingReader.entity.Book;
import com.amazingReader.service.Interface.RankingListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
@RequestMapping("reader/rank")
@Controller
public class RanksControl {
    @Autowired
    private RankingListService rankingListService;
    @RequestMapping("/showRanks1.action")
    public void showRanksByType1(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Book> bookList=new ArrayList<Book>();//书籍集合
        //男频推荐榜
        bookList=rankingListService.queryBookForRecommendOfMan();
        request.setAttribute("bookList",bookList);
        request.getRequestDispatcher("/JSP/allRanks.jsp?info="+1).forward(request,response);
    }

    @RequestMapping("/showRanks2.action")
    public void showRanksByType2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Book> bookList=new ArrayList<Book>();//书籍集合
        //男频热销榜
        bookList=rankingListService.queryBookForHotOfMan();
        request.setAttribute("bookList",bookList);
        request.getRequestDispatcher("/JSP/allRanks.jsp?info="+2).forward(request,response);
    }

    @RequestMapping("/showRanks3.action")
    public void showRanksByType3(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Book> bookList=new ArrayList<Book>();//书籍集合
        //男频收藏榜
        bookList=rankingListService.queryBookForCollectOfMan();
        request.setAttribute("bookList",bookList);
        request.getRequestDispatcher("/JSP/allRanks.jsp?info="+3).forward(request,response);
    }

    @RequestMapping("/showRanks4.action")
    public void showRanksByType4(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Book> bookList=new ArrayList<Book>();//书籍集合
        //男频收入榜
        bookList=rankingListService.queryBookForIncomeOfMan();
        request.setAttribute("bookList",bookList);
        request.getRequestDispatcher("/JSP/allRanks.jsp?info="+4).forward(request,response);
    }
    @RequestMapping("/showRanks5.action")
    public void showRanksByType5(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Book> bookList=new ArrayList<Book>();//书籍集合
        //男频收入榜
        bookList=rankingListService.queryBookForRecentCreateOfMan();
        request.setAttribute("bookList",bookList);
        request.getRequestDispatcher("/JSP/allRanks.jsp?info="+5).forward(request,response);
    }

    @RequestMapping("/showRanks6.action")
    public void showRanksByType6(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Book> bookList=new ArrayList<Book>();//书籍集合
        //女频推荐榜
        bookList=rankingListService.queryBookForRecommendOfWoman();
        request.setAttribute("bookList",bookList);
        request.getRequestDispatcher("/JSP/allRanks.jsp?info="+6).forward(request,response);
    }

    @RequestMapping("/showRanks7.action")
    public void showRanksByType7(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Book> bookList=new ArrayList<Book>();//书籍集合
        //女频热销榜
        bookList=rankingListService.queryBookForHotOfWoman();
        request.setAttribute("bookList",bookList);
        request.getRequestDispatcher("/JSP/allRanks.jsp?info="+7).forward(request,response);
    }
    @RequestMapping("/showRanks8.action")
    public void showRanksByType8(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Book> bookList=new ArrayList<Book>();//书籍集合
        //女频收藏榜
        bookList=rankingListService.queryBookForCollectOfWoman();
        request.setAttribute("bookList",bookList);
        request.getRequestDispatcher("/JSP/allRanks.jsp?info="+8).forward(request,response);
    }
    @RequestMapping("/showRanks9.action")
    public void showRanksByType9(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Book> bookList=new ArrayList<Book>();//书籍集合
        //女频推荐榜
        bookList=rankingListService.queryBookForIncomeOfWoman();
        request.setAttribute("bookList",bookList);
        request.getRequestDispatcher("/JSP/allRanks.jsp?info="+9).forward(request,response);
    }
    @RequestMapping("/showRanks10.action")
    public void showRanksByType10(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Book> bookList=new ArrayList<Book>();//书籍集合
        //女频新书榜
        bookList=rankingListService.queryBookForRecentCreateOfWoman();
        request.setAttribute("bookList",bookList);
        request.getRequestDispatcher("/JSP/allRanks.jsp?info="+10).forward(request,response);
    }

}
