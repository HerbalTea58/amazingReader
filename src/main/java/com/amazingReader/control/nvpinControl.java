package com.amazingReader.control;

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
import java.util.List;
@RequestMapping("/reader")
@Controller
public class nvpinControl {
    @Autowired
    private BookService bookService;
    @Autowired
    private RankingListService rankingListService;

    @RequestMapping("/womanChannel.action")
    public void getWomanBooks(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       /* //获得所有女频类型得到书籍
        List<Book> nvAllBooks=bookService.queryBooksOfWoman();*/
        //获得女频的热度排行榜 书籍
        List<Book> allBooksByHot=rankingListService.queryBookForHotOfWoman();
        Collections.shuffle(allBooksByHot);
        //获得女频推荐排行榜
        List<Book> allBooksByRecommend=rankingListService.queryBookForRecommendOfWoman();
        //第一板块
        //top_left
        Book topLeft1=allBooksByHot.get(0);
        Book topLeft2=allBooksByHot.get(1);
        Book topLeft3=allBooksByHot.get(2);
        Book topLeft4=allBooksByHot.get(3);
        Book topLeft5=allBooksByHot.get(4);

        //top_mid_1
        Book topMid1_1=allBooksByHot.get(5);
        List<Book> topMid1=new ArrayList<Book>();
        /*for (int i=6;i<10;i++){
            topMid1.add(allBooksByHot.get(i));//将书籍加入
        }*/
        for (Book book:allBooksByHot.subList(6,10)){
            topMid1.add(book);//将书籍加入
        }

        //top_mid_2
        Book topMid2_1=allBooksByHot.get(10);
        List<Book> topMid2=new ArrayList<Book>();
        /*for (int i=11;i<15;i++){
            topMid2.add(allBooksByHot.get(i));//将书籍加入
        }*/
        for (Book book:allBooksByHot.subList(11,15)){
            topMid2.add(book);//将书籍加入
        }

        //top_mid_3
        Book topMid3_1=allBooksByHot.get(15);
        List<Book> topMid3=new ArrayList<Book>();
       /* for (int i=16;i<20;i++){
            topMid3.add(allBooksByHot.get(i));//将书籍加入
        }*/
       if (allBooksByHot.size()<=20){
           for (Book book:allBooksByHot.subList(16,allBooksByHot.size())){
               topMid3.add(book);//将书籍加入
           }
       }


        //top_right_recommendRanking女频推荐榜
        //取10个
        Book topRights1=allBooksByRecommend.get(0);
        List<Book> topRights=new ArrayList<Book>();
        for (int i=0;i<10;i++){
            Book book=allBooksByHot.get(i);
            book.setReaderNum(i);
            topRights.add(book);//将书籍加入
        }


        request.setAttribute("topLeft1",topLeft1);
        request.setAttribute("topLeft2",topLeft2);
        request.setAttribute("topLeft3",topLeft3);
        request.setAttribute("topLeft4",topLeft4);
        request.setAttribute("topLeft5",topLeft5);
        request.setAttribute("topMid1_1",topMid1_1);
        request.setAttribute("topMid2_1",topMid2_1);
        request.setAttribute("topMid3_1",topMid3_1);
        request.setAttribute("topMid1",topMid1);
        request.setAttribute("topMid2",topMid2);
        request.setAttribute("topMid3",topMid3);
        request.setAttribute("topRights1",topRights1);
        request.setAttribute("topRights",topRights);


        //第二版 免费专区
        List<Book> freeBooksOfWoman=rankingListService.queryBookForFreeOfWoman();
        System.out.println("\n\n\n"+freeBooksOfWoman.size()+"====");
        if (freeBooksOfWoman.size()<=10){
            for (int i=0;i<freeBooksOfWoman.size();i++){
                freeBooksOfWoman.get(i).setReaderNum(i);
            }
            request.setAttribute("freeBooksOfWoman",freeBooksOfWoman);
        }else{
            List<Book> bookListFree=new ArrayList<Book>();
            for (int i=0;i<10;i++){
                if(i==freeBooksOfWoman.size()){
                    break;
                }
                Book book=freeBooksOfWoman.get(i);
                book.setReaderNum(i);
                bookListFree.add(book);
            }
            Collections.shuffle(bookListFree);//打乱顺序
            request.setAttribute("freeBooksOfWoman",bookListFree);
        }
        request.setAttribute("freeSize",freeBooksOfWoman.size());


        //第三板块
        //新书推荐
        List<Book> recentBooks=rankingListService.queryBookForRecentCreateOfWoman();
        //1.
        List<Book> newBookList1=new ArrayList<Book>();
        for (int i=0;i<5;i++){
            if(i==recentBooks.size()){
                break;
            }
            Book book=recentBooks.get(i);
            book.setReaderNum(i);
            newBookList1.add(book);
        }
        //2.
        List<Book> newBookList2=new ArrayList<Book>();
        for (int i=5;i<10;i++){
            if(i==recentBooks.size()){
                break;
            }
            Book book=recentBooks.get(i);
            book.setReaderNum(i);
            newBookList2.add(book);
        }
        request.setAttribute("newBookList1",newBookList1);
        request.setAttribute("newBookList2",newBookList2);

        //完结推荐
        List<Book> finishedBooks=rankingListService.queryBookForFinishedOfWoman();
        //1.
        List<Book> finishedBookList1=new ArrayList<Book>();
        for (int i=0;i<5;i++){
            if(i==finishedBooks.size()){
                break;
            }
            Book book=finishedBooks.get(i);
            book.setReaderNum(i);
            finishedBookList1.add(book);
        }
        //2.
        List<Book> finishedBookList2=new ArrayList<Book>();
        for (int i=5;i<10;i++){
            if(i==finishedBooks.size()){
                break;
            }
            Book book=finishedBooks.get(i);
            book.setReaderNum(i);
            finishedBookList2.add(book);
        }
        request.setAttribute("finishedBookList1",finishedBookList1);
        request.setAttribute("finishedBookList2",finishedBookList2);

        //收藏榜
        List<Book> bookListOfCollection=rankingListService.queryBookForCollectOfWoman();
        List<Book> collectedBookList=new ArrayList<Book>();
        for(int i=0;i<10;i++){
            if(i==bookListOfCollection.size()){
                break;
            }
            Book book=bookListOfCollection.get(i);
            book.setReaderNum(i);
            collectedBookList.add(book);
        }
        request.setAttribute("collectedBookList",collectedBookList);


        request.getRequestDispatcher("/JSP/nvpin.jsp").forward(request,response);

    }
}
