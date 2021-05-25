package com.amazingReader.control.Chen;

import com.amazingReader.entity.BookStyle;
import com.amazingReader.entity.ReaderOrder;
import com.amazingReader.entity.Writer;
import com.amazingReader.service.Interface.BookService;
import com.amazingReader.service.Interface.WriterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

@RequestMapping("/writerManage")
@RestController
public class WriterManageControl {
    @Autowired
    private WriterService writerService;
    @Autowired
    private BookService bookService;
    @RequestMapping("/countWriterIncome.action")
    public void countWriterIncomeByMonth(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Writer> writers = writerService.getWritersByName("");
        for (Writer writer : writers){
            Integer writerId = writer.getWriterId();
            /*//打赏收入
            List<Integer> rewardIncome = writerService.getRewardTypeIncomeByMonth(writerId);
            //订阅收入
            List<Integer> subScribeIncome = writerService.getSubscribeIncomeByMonth(writerId);*/
            Date curTime = new Date();
            Integer year = (curTime.getYear()+1900);
            //当月收入
            Integer curMonthIncome = writerService.getMonthIncomeOf(year+"",(curTime.getMonth()+1<=9?"0":"")+(curTime.getMonth()+1),writerId);
            writer.setCurMonthIncome(curMonthIncome);
            //上月收入
            Integer preMonthIncome = 0;
            if(curTime.getMonth()+1==1){
                preMonthIncome = writerService.getMonthIncomeOf((year-1)+"",12+"",writerId);
            }else {
                preMonthIncome = writerService.getMonthIncomeOf(year+"",(curTime.getMonth()+1<=9?"0":"")+curTime.getMonth()+"",writerId);
            }
            writer.setPreMonthIncome(preMonthIncome);
            //总订阅收入
            Integer totalSubscribeIncome =  writerService.getSubscribeIncome(writerId);

            writer.setTotalSubscribeIncome(totalSubscribeIncome);
        }
        System.out.println(writers);
        List<BookStyle> styles = bookService.getStylesNameLike("");
        //获得女频书籍的一级类别
        List<BookStyle> womanStyles=bookService.getFemaleFirstLabel();
        request.setAttribute("womanStyles",womanStyles);
        //获得男频书籍的一级类别
        List<BookStyle> manStyles=bookService.getMaleFirstLabel();
        request.setAttribute("manStyles",manStyles);
        request.setAttribute("writerInfoList",writers);
        request.getRequestDispatcher("/JSP/manageWriter.jsp").forward(request,response);
    }
}
