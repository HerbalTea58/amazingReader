package com.amazingReader.control.Chen;

import com.amazingReader.entity.Reader;
import com.amazingReader.service.Interface.BookService;
import com.amazingReader.service.Interface.ChapterService;
import com.amazingReader.service.Interface.ReaderService;
import org.json.HTTP;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@RequestMapping("/order")
@RestController
public class OrderingPageControl {
    @Autowired
    private ChapterService chapterService;
    @Autowired
    private BookService bookService;
    @Autowired
    private ReaderService readerService;

    private String[] chapters;
    private Integer price;

    @RequestMapping("/calculateSingleChapterPrice.action")
    public double calculateSingleChapterPrice(HttpServletRequest request){
        Integer chapterId = Integer.parseInt(request.getParameter("chapterId"));
        return chapterId == null ? 0 : chapterService.calculatePriceOfChapter(chapterId);
    }

    @RequestMapping("/calculatePrice.action")
    public Integer calculatePrice(HttpServletRequest request){
    chapters = request.getParameterValues("checkedChapter[]");
        Integer price = 0;
        for(String chapterId : chapters){
            price += chapterService.calculatePriceOfChapter(Integer.parseInt(chapterId));
        }
        this.price = price;
        return price;
    }

    @RequestMapping("/calculateBookPrice.action")
    public Integer calculateBookPrice(HttpServletRequest request){
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        return bookService.calculateBookPrice(bookId);
    }

    @RequestMapping("/ordering.action")
    public boolean orderingSingleChapter(HttpServletRequest request){
        int chapterId = Integer.parseInt(request.getParameter("chapterId"));
        int price = Integer.parseInt(request.getParameter("price"));
        int readerId = ((Reader)request.getSession().getAttribute("reader")).getReaderId();
        return readerService.orderChapter(chapterId,price,readerId);
    }

    @RequestMapping("/batchOrdering.action")
    public boolean batchOrdering(HttpServletRequest request, HttpServletResponse response){
        Reader reader = (Reader) request.getSession().getAttribute("reader");
        List<Integer> chapterList = new ArrayList<>();
        for(String chapter : chapters){
            chapterList.add(Integer.parseInt(chapter));
        }
        return readerService.orderChapters(chapterList,this.price,reader.getReaderId());
    }
}
