package com.amazingReader.control.Gao;

import com.amazingReader.entity.*;
import com.amazingReader.service.Interface.BookService;
import com.amazingReader.service.Interface.ChapterService;
import com.amazingReader.service.Interface.ReaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.List;

@RequestMapping("/reader")
@Controller
public class ReaderMoneyControl {
    @Autowired
    private ReaderService readerService;
    @Autowired
    private BookService bookService;
    @Autowired
    private ChapterService chapterService;

    @RequestMapping("/readermoney.action")
    public void getReaderScore(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Reader reader1 = (Reader) request.getSession().getAttribute("reader");
        Reader reader = new Reader();
        if (reader1 != null) {
            reader = readerService.getReaderInfo(reader1.getReaderId());
        }
        List<ReaderOrder> readerOrders = readerService.getOrdersByReaderId(reader.getReaderId());
        List<OrderIntroduce> orderIntroduceLists = new ArrayList<OrderIntroduce>();
        for (ReaderOrder readerOrder : readerOrders) {
            List<ReaderOrderDetail> readerOrderDetail = readerService.getOrderDetail(reader.getReaderId(), readerOrder.getReaderOrderId());
            ReaderOrderType readerOrderType = readerService.getReaderOrderType(readerOrder);
            OrderIntroduce orderIntroduce = new OrderIntroduce();
            orderIntroduce.setReaderOrder(readerOrder);
            Book book = bookService.getBookInfoByBookId(readerOrder.getReaderOrderObjectId());
            orderIntroduce.setBook(book);
            orderIntroduce.setReaderOrderType(readerOrderType);
            List<ReaderOrderDetail> readerOrderDetails = readerService.getOrderDetailByOrderID(readerOrder.getReaderOrderId());
            List<Chapter> chapterList = new ArrayList<>();
            for (ReaderOrderDetail readerOrderDetail1 : readerOrderDetails) {
                    Chapter chapter1 = chapterService.getChapterByChapterNumAndBookId(readerOrderDetail1.getReaderOrderDetailChapterNum(), book.getBookId());
                    chapterList.add(chapter1);

            }
            orderIntroduce.setChapter(chapterList);
            orderIntroduceLists.add(orderIntroduce);

        }
        request.setAttribute("orderIntroduceLists", orderIntroduceLists);
        request.setAttribute("reader", reader);
        request.getRequestDispatcher("/JSP/money.jsp").forward(request, response);
    }

    @RequestMapping("/readermoneyDetail.action")
    public void getReaderCost(int orderId, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Reader reader1 = (Reader) request.getSession().getAttribute("reader");
        Reader reader = new Reader();
        if (reader1 != null) {
            reader = readerService.getReaderInfo(reader1.getReaderId());
        }
        List<ReaderOrderDetail> readerOrderDetails = readerService.getOrderDetail(reader.getReaderId(),orderId);
        List<Chapter> chapterList = new ArrayList<>();
        for (ReaderOrderDetail readerOrderDetail1 : readerOrderDetails) {
                Chapter chapter1 = chapterService.getChapterByChapterNumAndBookId(readerOrderDetail1.getReaderOrderDetailChapterNum(),readerOrderDetail1.getReaderOrderDetailBookId());
                chapterList.add(chapter1);
            }

        request.setAttribute("chapterList",chapterList);
        request.getRequestDispatcher("/JSP/orderdetail.jsp").forward(request,response);
    }
}


