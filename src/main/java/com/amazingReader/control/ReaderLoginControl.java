package com.amazingReader.control;

import com.amazingReader.entity.Book;
import com.amazingReader.entity.BookStyle;
import com.amazingReader.entity.Reader;
import com.amazingReader.entity.ReaderHobbyRelation;
import com.amazingReader.service.Interface.BookService;
import com.amazingReader.service.Interface.RankingListService;
import com.amazingReader.service.Interface.ReaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

@RequestMapping("/Reader")
@RestController
public class ReaderLoginControl {
    @Autowired
    private ReaderService readerService;
    @Autowired
    private RankingListService rankingListService;
    @Autowired
    private BookService bookService;

    @RequestMapping("/changeSkin.action")
    public void changeSkin(HttpServletRequest request){
        String skin=request.getParameter("index");
        request.getSession().setAttribute("bgColor",skin);
    }
    @RequestMapping("/login.action")
    public void readerLogin(Reader reader, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // String name=request.getParameter("readerNeckName");
        String ck = request.getParameter("rem");
        //System.out.println(reader);
        int info = readerService.login(reader);
        request.getSession().setAttribute("a", "a");
        if (info == 1) {
            //登陆成功 创建会话对象
            Reader reader0 = readerService.queryReaderByInput(reader.getReaderNeckName());
            request.getSession().setAttribute("reader",reader0 );
            request.getSession().setAttribute("color",reader0.getReaderColor());//默认阅读背景色
            Cookie[] cookies = request.getCookies();
            if ("checked".equals(ck)) {
                boolean f = false;
                if (cookies != null) {
                    for (int i = 0; i < cookies.length; i++) {
                        if (cookies[i].getName().equals("loginInfo")) {
                            f = true;
                            break;
                        }
                    }
                    if (!f) {
                        // 构造Cookie对象
                        Cookie cookie = new Cookie("loginInfo", reader.getReaderNeckName() + "-" + reader.getReaderPassword());
                        // 设置过期时间
                        cookie.setMaxAge(60 * 60);
                        // 存储
                        cookie.setPath("/");

                        response.addCookie(cookie);
                    }
                }
            }
            //通过登录名获得读者信息
            Reader reader1 = readerService.queryReaderByInput(reader.getReaderNeckName());
            if (reader1 != null) {//当读者已经选择标签了 直接跳到登录界面
                if (readerService.getReaderChooseLove(reader1.getReaderId()).size() != 0) {
                    System.out.println(readerService.getReaderChooseLove(reader1.getReaderId()) + "+++++++1");
                    response.sendRedirect(request.getContextPath()+"/Reader/homePageShow.action");
                } else {
                    System.out.println(readerService.getReaderChooseLove(reader1.getReaderId()) + "+++++++2");
                    //当读者还未选择标签 得到bookstyle 的标签列表以供读者选择
                    List<BookStyle> labels = readerService.getAllBookStyle();
                    //将所有标签传参数
                    request.setAttribute("labels", labels);
                    request.getRequestDispatcher("/JSP/readerLovesChoose.jsp").forward(request, response);
                }
            }

        } else {
            request.setAttribute("uname", reader.getReaderNeckName());
            // request.setAttribute("Info",info);
            request.getRequestDispatcher("/JSP/login_reader.jsp?Info=" + info).forward(request, response);
        }

    }


    @RequestMapping("/loginCheck.action")
    public @ResponseBody
    boolean getReaderName(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String name = request.getParameter("name");
        System.out.println(name);
        if (readerService.isNameExist(name)) {
            return true;
        } else {
            return false;
        }
    }

    @RequestMapping("/register.action")
    public void readerRegister(Reader reader, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        readerService.register(reader);
        Reader reader1=readerService.queryReaderByInput(reader.getReaderNeckName());
        reader1.setReaderBalance(500);
        reader1.setReaderPortrait("image/reader/default_user.0.2.png");

        readerService.alterInfo(reader1);
        request.getRequestDispatcher("/JSP/login_reader.jsp").forward(request, response);
    }


    @RequestMapping("/registerCheckTel.action")
    public @ResponseBody
    boolean getReaderTelExist(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String tel = request.getParameter("tel");
        System.out.println(tel);
        //当数据库存在该手机号码时 readerService.isTelExist(tel)为true ；取非为false 那么可使用该手机号注册
        if (readerService.isTelExist(tel)) {
            return false;

        } else {
            return true;
        }
    }

    @RequestMapping("/findPass.action")//重置密码
    public void findPass(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String phone = request.getParameter("phone");
        String code = request.getParameter("code");
        String pass = request.getParameter("repass");
        System.out.println("\n\n$$$"+phone + "," + code + "," + pass);
        if (request.getSession().getAttribute("code")!=null && readerService.isTelExist(phone)) {
            if ((new Date().getTime() - ((Date) request.getSession().getAttribute("time")).getTime()) < 5 * 60 * 1000 && request.getSession().getAttribute("code").equals(code)) {
                //System.out.println(getMessageCode.getCode(phone));
                //通过电话号码查询该用户
                Reader reader = readerService.queryReaderByTel(phone);
                //修改密码
                reader.setReaderPassword(pass);
                readerService.alterInfo(reader);
                request.getRequestDispatcher("/JSP/login_reader.jsp").forward(request, response);

            }
        }
    }

    @RequestMapping("/checkIdentifyCode.action")
    public  boolean checkIdentifyCode(HttpServletRequest request,HttpServletResponse response){
        String phone = request.getParameter("phone");
        String code = request.getParameter("code");
        if (request.getSession().getAttribute("code") != null && readerService.isTelExist(phone)) {
            if ((new Date().getTime() - ((Date) request.getSession().getAttribute("time")).getTime()) < 5 * 60 * 1000 && request.getSession().getAttribute("code").equals(code)) {
                return true;
            }else {
                return false;
            }

        } else {
            return false;
        }

    }


    @RequestMapping("/readerLovesAdd.action")
    public void readerLovesAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获得读者传递过来的标签(bookstyle) id集合
        String ids[] = request.getParameterValues("checkbox");
        String name=request.getParameter("radio");//获得性别
        System.out.println("\n\n"+name);
        Reader reader=new Reader();
        reader = (Reader) request.getSession().getAttribute("reader");
        if ("男生".equals(name.trim())){
            reader.setReaderSex(true);

        }else {
            reader.setReaderSex(false);
        }
        if (ids.length>=0){
            System.out.println(ids.length + "~~readerLovesAdd");

            for (int i = 0; i < ids.length; i++) {//将读者爱好标签 加入表中
                ReaderHobbyRelation readerHobbyRelation = new ReaderHobbyRelation();
                readerHobbyRelation.setHobbyReaderId(reader.getReaderId());
                readerHobbyRelation.setHobbyLabelId(Integer.parseInt(ids[i]));
                readerService.addLovesBookStyle(readerHobbyRelation);
            }
        }
        readerService.alterInfo(reader);

        response.sendRedirect(request.getContextPath()+"/Reader/homePageShow.action");
    }

    @RequestMapping("/homePageShow.action")//显示首页信息
    public void homePageShow(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        long time = new Date().getTime();
        //轮播图显示 选择3个类型 每个榜单选取4个
        List<Book> booksByIncome=rankingListService.queryBookForIncome();//收入榜
       // System.out.println("\n\n\n\n"+"拿完收入榜单花了："+(new Date().getTime()-time)+"\n\n\n\n");
        List<Book> booksByCommend=rankingListService.queryBookForRecommend();//推荐榜
      //  System.out.println("\n\n\n\n"+"拿完推荐榜单花了："+(new Date().getTime()-time)+"\n\n\n\n");
        List<Book> booksByCollect=rankingListService.queryBookForCollect();//收藏榜
      //  System.out.println("\n\n\n\n"+"拿完收藏榜单花了："+(new Date().getTime()-time)+"\n\n\n\n");
        List<Book> booksByOrder=rankingListService.queryBookForOrder();//热销榜
      //  System.out.println("\n\n\n\n"+"拿完热销榜单花了："+(new Date().getTime()-time)+"\n\n\n\n");


      //  System.out.println("\n\n\n\n"+"拿完榜单花了："+(new Date().getTime()-time)+"\n\n\n\n");

        //去除重复的书籍
        List<Book> bookList0=new ArrayList<Book>();
        for(int i=0;i<3;i++){
            bookList0.add(booksByIncome.get(i));
        }
        int count1=0;

            for (Book book : booksByCommend) {
                //保证每个类型四个
                if (!bookList0.contains(book)) {
                    bookList0.add(book);
                    count1++;
                }
                if (count1==3){break;}
            }
        int count2=0;
        for (Book book : booksByCollect) {
            //保证每个类型四个
            if (!bookList0.contains(book)) {
                bookList0.add(book);
                count2++;
            }
            if (count2==3){break;}

        }
        int count3=0;
        for (Book book : booksByOrder) {
            //保证每个类型四个
            if (!bookList0.contains(book)) {
                bookList0.add(book);
                count3++;
            }
            if (count3==3){break;}

        }
       /* System.out.println("\n\n++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
        System.out.println("滚动条书籍个数"+bookList0.size());
        System.out.println("\n\n");*/
        request.setAttribute("bookList0",bookList0);


       // System.out.println("\n\n\n\n"+"到去重花了："+(new Date().getTime()-time)+"\n\n\n\n");

       // System.out.println(booksByIncome.subList(0,3)+","+booksByCommend.subList(0,3)+","+booksByCollect.subList(0,3)+","+booksByOrder.subList(0,3));
        //猜你喜欢显示
        Reader readerSession= (Reader)request.getSession().getAttribute("reader");
        if (readerSession!=null){

            List<Integer> lists=readerService.readerLoveBookStyleIds(readerSession.getReaderId());
           /* System.out.println(lists+"~****");*/
            List<Book> bookList1=new ArrayList<Book>();
            for (int i:lists){//通过标签id获得所有对应的书籍
                if (bookService.getBooksByBookStyle(i).size()!=0){
                    for (Book book : bookService.getBooksByBookStyle(i)){
                        if(!bookList1.contains(book)){
                            bookList1.add(book);
                        }
                    }
                }
            }
            //如果读者喜爱类型书籍不够填充 猜你喜欢版块 就推荐 推荐榜书籍 一共15本
            int count=bookList1.size();

                for (Book b:booksByCommend){

                    if(!bookList1.contains(b)){
                        bookList1.add(b);
                        count++;
                    }
                    if (count>=15){
                        break;
                    }
                }

            bookList1=bookService.showBooksPrepared(bookList1);//获得乱序书籍，并且加了readerNum
          /*  System.out.println("\n\n");
            System.out.println("=================================================================");
            System.out.println(bookList1.size());
            for (Book book:bookList1){
                System.out.println(book.getReaderNum());
                System.out.println(book.getWriter().getWriterNeckName());
            }
          System.out.println(bookList1.size()+"************************************");
            System.out.println("+++++++++++++++++++++++++++++++++++++++");
            System.out.println("\n\n");*/

           request.setAttribute("booList",bookList1);

        }

     //   System.out.println("\n\n\n\n"+"到拿完猜你喜欢花了："+(new Date().getTime()-time)+"\n\n\n\n");



        //男生首页频道
        //获得男生类别的图书
        List<Book> manList= bookService.queryBooksOfMan();
        Collections.shuffle(manList);//打乱顺序
            //重磅推荐
       Book manListLeft=manList.get(0);//获得集合第一个数据
      /*  System.out.println("\n\n");
        System.out.println("``````````````````````````````````````````````````````````````");
        System.out.println(manListLeft);*/
            //中间条推荐
        List<Book> manListMid=new ArrayList<Book>();
      for (int i=1;i<7;i++){
          manListMid.add(manList.get(i));
      }
            //热销榜
        List<Book> manHotList=rankingListService.queryBookForHotOfMan();
        request.setAttribute("manListLeft",manListLeft);
        manListMid=bookService.showBooksPrepared(manListMid);
        request.setAttribute("manListMid",manListMid);
        manHotList=bookService.showBooksPrepared(manHotList);
        request.setAttribute("manHotList",manHotList);

        //System.out.println("\n\n\n\n"+"到拿完男生榜单花了："+(new Date().getTime()-time)+"\n\n\n\n");


        //女生首页频道
        List<Book> womanList=bookService.queryBooksOfWoman();
        Collections.shuffle(womanList);
            //重磅推荐
        Book womanListLeft=womanList.get(0);
            //中间条推荐
        List<Book> womanListMid=new ArrayList<Book>();
        for(int i=1;i<7;i++){
            womanListMid.add(womanList.get(i));
        }
       /* System.out.println("\n\n");
        System.out.println("首页女频+=====================+"+womanListMid.size()+"========================");*/
            //热销榜
        List<Book> womanHotList=rankingListService.queryBookForHotOfWoman();
        request.setAttribute("womanListLeft",womanListLeft);
        womanListMid=bookService.showBooksPrepared(womanListMid);
        request.setAttribute("womanListMid",womanListMid);
        womanHotList=bookService.showBooksPrepared(womanHotList);
        request.setAttribute("womanHotList",womanHotList);

        System.out.println("\n\n\n\n\n\n"+(new Date().getTime() - time)+"\n\n\n\n\n\n\n");

        request.getRequestDispatcher("/JSP/homePage.jsp").forward(request,response);
    }

}
