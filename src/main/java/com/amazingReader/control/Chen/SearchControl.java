package com.amazingReader.control.Chen;

import com.amazingReader.entity.Book;
import com.amazingReader.entity.BookLabel;
import com.amazingReader.entity.BookStyle;
import com.amazingReader.entity.utilEntity.PageInfos;
import com.amazingReader.service.Interface.BookService;
import com.amazingReader.service.Interface.RankingListService;
import com.amazingReader.service.Interface.WriterService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

@RequestMapping("/reader")
@RestController
public class SearchControl {//搜索书籍页面
    @Autowired
    private BookService bookService;
    @Autowired
    private RankingListService rankingListService;
    @Autowired
    private WriterService writerService;


    @RequestMapping("/searchBooks.action")
    public void searchBooksByCondition(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
/*        //女频书籍的一级类型 以及对应的二级类型
        List<BookStyle> womanStyles=bookService.getFemaleFirstLabel();
        List<List<BookStyle>> styles = new ArrayList<>();
        for(int i=0;i<womanStyles.size();i++){
            styles.add(bookService.getStyle(womanStyles.get(i).getBookStyleId()));
        }
        request.setAttribute("womanStyles",womanStyles);//女频一级类
        request.setAttribute("styles",styles);//女频二级类


        //男频
        List<BookStyle> manStyles=bookService.getMaleFirstLabel();
        List<List<BookStyle>> manlist=new ArrayList<>();
        for(int i=0;i<manlist.size();i++){
            manlist.add(bookService.getStyle(manStyles.get(i).getBookStyleId()));
        }
        request.setAttribute("manStyles",manStyles);//男频一级类
        request.setAttribute("manlist",manlist);//男频二级类*/

        String keyWord = request.getParameter("keyWord");
        Integer curPage = Integer.parseInt(request.getParameter("pageNum")==null?"1":request.getParameter("pageNum"));

        request.setAttribute("keyWord",keyWord);
        List<Book> books = new ArrayList<>();
        List<Book> writerBooks = new ArrayList<>();
        List<Book> booksByLabel = new ArrayList<>();
        if(keyWord!=null&&!keyWord.trim().equals("")) {
            books = bookService.getBooksByName(keyWord);
            writerBooks = bookService.getBookByWriterNameLike(keyWord);
            booksByLabel = bookService.getByLabelNameOrStyleName(keyWord);
            books.addAll(booksByLabel);
            books.addAll(writerBooks);
            books = new ArrayList<>(new LinkedHashSet<>(books));
        }
        Integer perPageNum = 6;
        Integer startPosition = (curPage-1)*perPageNum>books.size()?books.size():(curPage-1)*perPageNum;
        Integer endPosition = (curPage)*perPageNum>books.size()?books.size():(curPage)*perPageNum;
        PageInfos<Book> pageInfo = new PageInfos<Book>(books.size(),curPage,books.subList(startPosition,endPosition),perPageNum);

        List<Book> recommendBooks = rankingListService.queryBookForRecommend();

        request.setAttribute("books",pageInfo);
        request.setAttribute("recommendBooks",recommendBooks.subList(0,8));

        request.getRequestDispatcher("/JSP/searchPage.jsp").forward(request,response);
    }

    @RequestMapping("/searchBooksByManager.action")
    public void searchBooksByConditionForManager(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keyWord = request.getParameter("keyWord");
        System.out.println("\n\n"+keyWord);
        Integer pageNum = Integer.parseInt(request.getParameter("pageNum") == null ? "1" : request.getParameter("pageNum"));

        PageHelper.startPage(pageNum == null ? 1 : pageNum, 10);
        List<Book> books = new ArrayList<>();
        List<Book> writerBooks = new ArrayList<>();
        if (keyWord != null || !keyWord.trim().equals("")) {
            books = bookService.getBooksByNameForManager(keyWord);
            writerBooks = bookService.getBookByWriterNameLike(keyWord);
        }
        List<Book> booksByLabel = new ArrayList<>();
        if (books.size() == 0)
            booksByLabel = bookService.getByLabelNameOrStyleName(keyWord);
        books.removeAll(booksByLabel);
        books.addAll(booksByLabel);
        books.removeAll(writerBooks);
        books.addAll(writerBooks);
        books=new ArrayList<>(new LinkedHashSet<>(books));
        PageInfo<Book> pageInfo = new PageInfo<>(books);

        PageHelper.startPage(1, 8);
       /* List<Book> recommendBooks = rankingListService.queryBookForRecommend();
        PageInfos<Book> recommendBooksInfo = new PageInfos<>(recommendBooks);*/
        System.out.println("\n\n"+pageInfo.getSize());
        request.setAttribute("bookList", pageInfo);
        //获得女频书籍的一级类别
        List<BookStyle> womanStyles=bookService.getFemaleFirstLabel();
        request.setAttribute("womanStyles",womanStyles);
        //获得男频书籍的一级类别
        List<BookStyle> manStyles=bookService.getMaleFirstLabel();
        request.setAttribute("manStyles",manStyles);


        request.getRequestDispatcher("/JSP/manageBook.jsp").forward(request, response);


}
    @RequestMapping("/helper.action")
    public List<String> searchHelp(HttpServletRequest request){
        String typing = request.getParameter("typing");
        List<BookStyle> styles = bookService.getStylesNameLike(typing);
        List<BookLabel> labels = bookService.getlabelsNameLike(typing);
        List<Book> books = bookService.getBooksByName(typing);
        List<Book> writerBooks = bookService.getBookByWriterNameLike(typing);
        List<String> helper = new ArrayList<>();
        for(BookStyle style : styles){
            helper.add(style.getBookStyleName());
        }
        for(BookLabel label : labels){
            helper.add(label.getBookLabelName());
        }
        for (Book book : books){
            helper.add(book.getBookName());
        }
        for (Book book : writerBooks){
            helper.add(book.getBookName());
        }
        return helper;
    }
}
