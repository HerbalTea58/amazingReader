package com.amazingReader.control;

import com.amazingReader.entity.*;
import com.amazingReader.entity.utilEntity.WriterBook;
import com.amazingReader.entity.utilEntity.WriterData;
import com.amazingReader.entity.utilEntity.WriterOrder;
import com.amazingReader.service.Interface.BookService;
import com.amazingReader.service.Interface.ChapterService;
import com.amazingReader.service.Interface.ManagerService;
import com.amazingReader.service.Interface.WriterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@RequestMapping("/Writer")
@Controller
public class WriterControl {
    @Autowired
    private WriterService writerService;
    @Autowired
    private BookService bookService;
    @Autowired
    private ChapterService chapterService;
    @Autowired
    private ManagerService managerService;


    @RequestMapping("WriterHome.action")
    public void WriterHome(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {
        HttpSession session = request.getSession();
        Writer writer = (Writer)session.getAttribute("LoginWriter");

        List<Integer> signins = writerService.getSignin(writer.getWriterId());
        request.setAttribute("signins", signins);
        Integer num = writerService.getNumByYesAndToday(writer.getWriterId());
        request.setAttribute("wordnum", num);
        request.getRequestDispatcher("/JSP/writer_home.jsp").forward(request,response);
    }

    @RequestMapping(value = "/SignIn.action" )
    public @ResponseBody boolean SignIn(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Writer writer = (Writer)session.getAttribute("LoginWriter");

        Signin signin = new Signin();
        signin.setSignWriterId(writer.getWriterId());

        Calendar calendar = Calendar.getInstance();
        // ?????????
        int year = calendar.get(Calendar.YEAR);
        // ?????????
        int month = calendar.get(Calendar.MONTH);
        // ?????????
        int date = calendar.get(Calendar.DATE);
        calendar.set(year, month, date);
        Long date1 = calendar.getTimeInMillis();
        int date2 = (int) (date1/1000);
        signin.setSignDate(date2);

        boolean re = writerService.add(signin);
        return  re;
    }


    @RequestMapping("/WriterDate.action")
    public void FindWriterDate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Writer writer = (Writer)session.getAttribute("LoginWriter");

        Calendar c = Calendar.getInstance();
        c.add(Calendar.DAY_OF_MONTH, -1);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String time = formatter.format(c.getTime());


        List<Book> bookList =  bookService.getBookByWriterId(writer.getWriterId());
        int alltimes = writerService.getAllClickTimes(writer.getWriterId());
        int timetimes = writerService.getAllClickTimesByTime(writer.getWriterId(), time);
        int avgtimes = writerService.getAvgClickTimes(writer.getWriterId());
        int maxtimes = writerService.getMaxClickTimes(writer.getWriterId());

        List<WriterData> chapterList = writerService.getChapterByWriter(writer.getWriterId());
        request.setAttribute("AllTimes", alltimes);
        request.setAttribute("YesTimes", timetimes);
        request.setAttribute("AvgTimes", avgtimes);
        request.setAttribute("MaxTimes",maxtimes);
        request.setAttribute("bookList", bookList);

        request.setAttribute("chapterList", chapterList);
        request.getRequestDispatcher("/JSP/writer_data.jsp").forward(request,response);
    }

    @RequestMapping("/WriterDataByBook.action")
    public void FindWriterDataByBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Writer writer = (Writer)session.getAttribute("LoginWriter");
        
        Calendar c = Calendar.getInstance();
        c.add(Calendar.DAY_OF_MONTH, -1);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String time = formatter.format(c.getTime());
        
        int alltimes;
        int timetimes;
        int avgtimes;
        int maxtimes;
        Book book = null;
        List<WriterData> chapterList;
        int bookid = Integer.parseInt(request.getParameter("bookid"));
        if(bookid == 0){
            alltimes = writerService.getAllClickTimes(writer.getWriterId());
            timetimes = writerService.getAllClickTimesByTime(writer.getWriterId(), time);
            avgtimes = writerService.getAvgClickTimes(writer.getWriterId());
            maxtimes = writerService.getMaxClickTimes(writer.getWriterId());
            chapterList = writerService.getChapterByWriter(writer.getWriterId());

            request.setAttribute("BookName", "????????????");
        }else {
            alltimes = bookService.getClickTimes(bookid);
            timetimes = writerService.getClickTimesByDate(bookid, time);
            avgtimes = writerService.getAvgClickTimesByBook(bookid);
            maxtimes = writerService.getMaxClickTimesByBook(bookid);
            chapterList = writerService.getChapterByBook(bookid);

            book = bookService.getBookInfoByBookId(bookid);
            request.setAttribute("BookName", book.getBookName());
        }

        List<Book> bookList =  bookService.getBookByWriterId(writer.getWriterId());

        request.setAttribute("AllTimes", alltimes);
        request.setAttribute("YesTimes", timetimes);
        request.setAttribute("AvgTimes", avgtimes);
        request.setAttribute("MaxTimes",maxtimes);
        request.setAttribute("bookList", bookList);
        request.setAttribute("chapterList", chapterList);

        request.getRequestDispatcher("/JSP/writer_data.jsp").forward(request,response);
    }

    @RequestMapping("/WriterIncome.action")
    public void FindWriterIncome(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Writer writer = (Writer)session.getAttribute("LoginWriter");
        List<Book> bookList =  bookService.getBookByWriterId(writer.getWriterId());
        request.setAttribute("bookList", bookList);
        Double income = writerService.getAllIncome(writer.getWriterId());
        List<WriterOrder> writerOrderList = writerService.getAllOrder(writer.getWriterId());
        Double leftIncome = writerService.getMoney(writer.getWriterId());
        request.setAttribute("LeftIncome", leftIncome);
        request.setAttribute("AllIncome", income);
        request.setAttribute("AllOrder", writerOrderList);
        request.getRequestDispatcher("/JSP/writer_income.jsp").forward(request,response);
    }

    @RequestMapping("/WriterIncomeDetail1.action")
    public void FindWriterIncomeDetail1(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String year = request.getParameter("findyear");
        String month = request.getParameter("findmonth");
        HttpSession session = request.getSession();
        Writer writer = (Writer)session.getAttribute("LoginWriter");
        Double income=0.0;
        List<WriterOrder> writerOrderList=null;
        if((year.equals("null")) & (month.equals("null"))){
            income = writerService.getAllIncome(writer.getWriterId());
            writerOrderList = writerService.getAllOrder(writer.getWriterId());

        }else{
            income = writerService.getIncomeByDate(year,month,writer.getWriterId());
            writerOrderList = writerService.getWriterOrderByWriterIdAndTime(year,month,writer.getWriterId());

        }
        List<Book> bookList =  bookService.getBookByWriterId(writer.getWriterId());
        request.setAttribute("bookList", bookList);
        request.setAttribute("AllIncome", income);
        request.setAttribute("AllOrder", writerOrderList);
        request.getRequestDispatcher("/JSP/writer_income.jsp").forward(request,response);
    }
    @RequestMapping("/WriterIncomeDetail2.action")
    public void FindWriterIncomeDetail2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Writer writer = (Writer)session.getAttribute("LoginWriter");
        int bookId = Integer.parseInt(request.getParameter("findnovels"));
        Double income=0.0;
        List<WriterOrder> writerOrderList=null;
        if(bookId == 0){
            income = writerService.getAllIncome(writer.getWriterId());
            writerOrderList = writerService.getAllOrder(writer.getWriterId());
        }else {
            income = writerService.getIncomeByBookId(bookId);
            writerOrderList = writerService.getWriterOrderByBookId(bookId);
        }
        request.setAttribute("AllIncome", income);
        request.setAttribute("AllOrder", writerOrderList);
        List<Book> bookList =  bookService.getBookByWriterId(writer.getWriterId());
        request.setAttribute("bookList", bookList);
        request.getRequestDispatcher("/JSP/writer_income.jsp").forward(request,response);
    }

    @RequestMapping("/WriterIncomeRead.action")
    public void WriterIncomeRead(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Writer writer = (Writer)session.getAttribute("LoginWriter");
        List<Book> bookList =  bookService.getBookByWriterId(writer.getWriterId());
        request.setAttribute("bookList", bookList);
        Double income = writerService.getAllIncomeRead(writer.getWriterId());
        List<WriterOrder> writerOrderList = writerService.getAllOrderRead(writer.getWriterId());
        request.setAttribute("AllIncome", income);
        request.setAttribute("AllOrder", writerOrderList);
        request.getRequestDispatcher("/JSP/writer_income_read.jsp").forward(request,response);
    }
    @RequestMapping("/WriterReadIncomeDetail1.action")
    public void WriterReadIncomeDetail1(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String year = request.getParameter("findyear");
        String month = request.getParameter("findmonth");
        HttpSession session = request.getSession();
        Writer writer = (Writer)session.getAttribute("LoginWriter");
        Double income=0.0;
        List<WriterOrder> writerOrderList=null;
        if((year.equals("null")) & (month.equals("null"))){
            income = writerService.getAllIncomeRead(writer.getWriterId());
            writerOrderList = writerService.getAllOrderRead(writer.getWriterId());

        }else{
            income = writerService.getIncomeByDateAndType(year,month,writer.getWriterId(),1);
            writerOrderList = writerService.getWriterOrderByWriterIdAndTimeAndType(year,month,writer.getWriterId(), 1);
        }
        List<Book> bookList =  bookService.getBookByWriterId(writer.getWriterId());
        request.setAttribute("bookList", bookList);
        request.setAttribute("AllIncome", income);
        request.setAttribute("AllOrder", writerOrderList);
        request.getRequestDispatcher("/JSP/writer_income_read.jsp").forward(request,response);
    }

    @RequestMapping("/WriterReadIncomeDetail2.action")
    public void WriterReadIncomeDetail2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Writer writer = (Writer)session.getAttribute("LoginWriter");
        int bookId = Integer.parseInt(request.getParameter("findnovels"));
        Double income=0.0;
        List<WriterOrder> writerOrderList=null;
        if(bookId == 0){
            income = writerService.getAllIncomeRead(writer.getWriterId());
            writerOrderList = writerService.getAllOrderRead(writer.getWriterId());
        }else {
            income = writerService.getIncomeByBookIdAndType(bookId, 1);
            writerOrderList = writerService.getWriterOrderByBookIdAndType(bookId, 1);
        }
        request.setAttribute("AllIncome", income);
        request.setAttribute("AllOrder", writerOrderList);
        List<Book> bookList =  bookService.getBookByWriterId(writer.getWriterId());
        request.setAttribute("bookList", bookList);
        request.getRequestDispatcher("/JSP/writer_income_read.jsp").forward(request,response);
    }


    @RequestMapping("/WriterIncomeReward.action")
    public void WriterIncomeReward(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Writer writer = (Writer)session.getAttribute("LoginWriter");
        List<Book> bookList =  bookService.getBookByWriterId(writer.getWriterId());
        request.setAttribute("bookList", bookList);
        Double income = writerService.getAllIncomeReward(writer.getWriterId());
        List<WriterOrder> writerOrderList = writerService.getAllOrderReward(writer.getWriterId());
        request.setAttribute("AllIncome", income);
        request.setAttribute("AllOrder", writerOrderList);
        request.getRequestDispatcher("/JSP/writer_income_reward.jsp").forward(request,response);
    }
    @RequestMapping("/WriterRewardIncomeDetail1.action")
    public void WriterRewardIncomeDetail1(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String year = request.getParameter("findyear");
        String month = request.getParameter("findmonth");
        HttpSession session = request.getSession();
        Writer writer = (Writer)session.getAttribute("LoginWriter");
        Double income=0.0;
        List<WriterOrder> writerOrderList=null;
        if((year.equals("null")) & (month.equals("null"))){
            income = writerService.getAllIncomeRead(writer.getWriterId());
            writerOrderList = writerService.getAllOrderRead(writer.getWriterId());

        }else{
            income = writerService.getIncomeByDateAndType(year,month,writer.getWriterId(),2);
            writerOrderList = writerService.getWriterOrderByWriterIdAndTimeAndType(year,month,writer.getWriterId(), 2);
        }
        List<Book> bookList =  bookService.getBookByWriterId(writer.getWriterId());
        request.setAttribute("bookList", bookList);
        request.setAttribute("AllIncome", income);
        request.setAttribute("AllOrder", writerOrderList);
        request.getRequestDispatcher("/JSP/writer_income_reward.jsp").forward(request,response);
    }
    @RequestMapping("/WriterRewardIncomeDetail2.action")
    public void WriterRewardIncomeDetail2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Writer writer = (Writer)session.getAttribute("LoginWriter");
        int bookId = Integer.parseInt(request.getParameter("findnovels"));
        Double income=0.0;
        List<WriterOrder> writerOrderList=null;
        if(bookId == 0){
            income = writerService.getAllIncomeRead(writer.getWriterId());
            writerOrderList = writerService.getAllOrderRead(writer.getWriterId());
        }else {
            income = writerService.getIncomeByBookIdAndType(bookId, 2);
            writerOrderList = writerService.getWriterOrderByBookIdAndType(bookId, 2);
        }
        request.setAttribute("AllIncome", income);
        request.setAttribute("AllOrder", writerOrderList);
        List<Book> bookList =  bookService.getBookByWriterId(writer.getWriterId());
        request.setAttribute("bookList", bookList);
        request.getRequestDispatcher("/JSP/writer_income_reward.jsp").forward(request,response);
    }


    @RequestMapping("/WriterNovels.action")
    public void WriterNovels(String title, String detail,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Writer writer = (Writer)session.getAttribute("LoginWriter");
        List<WriterBook> bookList = bookService.getBookByWriterId2(writer.getWriterId());
        request.setAttribute("NovelList", bookList);
        request.getRequestDispatcher("/JSP/writer_novels.jsp").forward(request,response);
    }

    @RequestMapping("/WriterAddNovels.action")
    public void WriterAddNovels(String title, String detail,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Writer writer = (Writer)session.getAttribute("LoginWriter");
        List<BookStyle> maleList = bookService.getMaleFirstLabel();
        List<BookStyle> femaleList = bookService.getFemaleFirstLabel();
        List<Book> bookList = bookService.getBookByWriterId(writer.getWriterId());
        request.setAttribute("NovelList", bookList);
        request.setAttribute("MaleList", maleList);
        request.setAttribute("FemaleList", femaleList);
//        request.setAttribute("StyleList", styleList);
        request.getRequestDispatcher("/JSP/writer_addBook.jsp").forward(request,response);
    }

    @RequestMapping(value = "/selectStyle.action" )
    public @ResponseBody List<BookStyle> selectStyle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int styleId = Integer.parseInt(request.getParameter("styleId"));
        List<BookStyle> bookStyleList = bookService.getStyle(styleId);
        return bookStyleList;
    }

    @RequestMapping("/WriterAddNewNovel.action")
    public void WriterAddNewNovel(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {
        Book book = new Book();
        HttpSession session = request.getSession();
        Writer writer = (Writer)session.getAttribute("LoginWriter");
        String name = request.getParameter("name");
        int bookstyle = Integer.parseInt(request.getParameter("bookstyle"));
        String introduction = request.getParameter("introduction");
        String label = request.getParameter("labels");

        book.setBookName(name);
        book.setBookCover("image/book/book.jpg");
        book.setBookWriterId(writer.getWriterId());
        book.setBookStyleId(bookstyle);
        book.setBookShortDescribe(introduction);

        Calendar c = Calendar.getInstance();
        c.add(Calendar.DAY_OF_MONTH, 0);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String time1 = formatter.format(c.getTime());
//        String strStart = time.substring(0, 10);
        Date editTime = formatter.parse(time1);

        book.setBookPushDateTime(editTime);
        writerService.createBook(book);

        int bookid = bookService.getBookIdByName(name);
        String[] labels = null;
        int i=0;
        labels = label.split("X");
        BookLabelRelation bookLabelRelation = new BookLabelRelation();
        for(String n:labels){
            Integer id = writerService.getByLabelName(n);
            if(id == null){
                writerService.insertLabel(n);
                id = writerService.getByLabelName(n);
            }
            bookLabelRelation.setBookId(bookid);
            bookLabelRelation.setLabelId(id);
            writerService.add(bookLabelRelation);
        }

        List<Book> bookList = bookService.getBookByWriterId(writer.getWriterId());
        request.setAttribute("NovelList", bookList);
        request.getRequestDispatcher("/JSP/writer_novels.jsp").forward(request,response);
    }

    @RequestMapping("/WriterInfoDetail.action")
    public void WriterInfoDetail(MultipartFile imgFileUp, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Writer writer = (Writer)session.getAttribute("LoginWriter");
        String writerCover = null;
        if(imgFileUp.getOriginalFilename() != ""){
            String filename = "/writer/"+writer.getWriterId()+"/"+imgFileUp.getOriginalFilename();
            writerCover = "image/writer/"+writer.getWriterId()+"/"+imgFileUp.getOriginalFilename();
            String imgFile = request.getServletContext().getRealPath("image");
            String img = imgFile+filename;
            File file = new File(img);
            File wfile = file.getParentFile();
            if(!wfile.exists()){
                wfile.mkdirs();
            }
            if(!file.exists()){
                file.createNewFile();
            }else{
                file.delete();
                file.createNewFile();
            }

            imgFileUp.transferTo(file);
        }
        else {
            writerCover = writer.getWriterPortrait();
        }


        String writerName = request.getParameter("writerName2");
        Boolean sex = Boolean.valueOf(request.getParameter("sex"));
        String trueName = request.getParameter("trueName2");
        String phones = request.getParameter("phone2");
        String address = request.getParameter("add2");
        String account = request.getParameter("account2");
        String shortRe = request.getParameter("shortRe2");

        writer.setWriterPortrait(writerCover);
        writer.setWriterNeckName(writerName);
        writer.setWriterSex(sex);
        writer.setWriterRealName(trueName);
        writer.setWriterTel(phones);
        writer.setWriterAddress(address);
        writer.setWriterAccount(account);
        writer.setWriterShortRecommend(shortRe);

        writerService.alterWriterInfo(writer);
        Writer LoginWriter = writerService.getWriterInfo(writer.getWriterId());
        session.setAttribute("LoginWriter", LoginWriter);

        request.getRequestDispatcher("/JSP/writer_owner.jsp").forward(request,response);
    }

    @RequestMapping(value = "/Upmoney.action" )
    public @ResponseBody double Upmoney(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {
        Double money = Double.valueOf(request.getParameter("money"));

        HttpSession session = request.getSession();
        Writer writer = (Writer)session.getAttribute("LoginWriter");


        Calendar c = Calendar.getInstance();
        c.add(Calendar.DAY_OF_MONTH, 0);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String time1 = formatter.format(c.getTime());
//        String strStart = time.substring(0, 10);
        Date editTime = formatter.parse(time1);

        WriterIncome writerIncome = new WriterIncome();
        writerIncome.setWriterId(writer.getWriterId());
        writerIncome.setWriterIncomeTypeId(4);
        writerIncome.setWriterIncomeTotal((int) (-money*100));
        writerIncome.setWriterIncomeDate(editTime);
        writerIncome.setReaderId(0);
        Double num = writerService.upMoney(writerIncome);

        return num;
    }

    @RequestMapping("/OutLogin.action")
    public void OutLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession ht=request.getSession(true);
        ht.removeAttribute("LoginWriter");

        request.getRequestDispatcher("/JSP/login_writer.jsp").forward(request,response);
    }

    @RequestMapping(value = "/ChangePassword.action" )
    public @ResponseBody boolean ChangePassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Writer writer = (Writer)session.getAttribute("LoginWriter");

        String Password = request.getParameter("password");
        boolean re = writerService.ChangePass(writer.getWriterId(), Password);
        if(re == true){
            writer.setWriterPassword(Password);
            session.setAttribute("LoginWriter", writer);
        }
        return re;
    }

    @RequestMapping(value = "/checkWriterName.action" )
    public @ResponseBody int checkWriterName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Writer writer = (Writer)session.getAttribute("LoginWriter");
        int re = 1;
        String name1 = request.getParameter("value");
        Writer writer1 = writerService.getWriterByName(name1);
        if((writer1 == null) || (writer1.getWriterNeckName().equals(name1)))
            re = 2;
        return re;
    }

    @RequestMapping(value = "/checkBookName.action" )
    public @ResponseBody int checkBookName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Writer writer = (Writer)session.getAttribute("LoginWriter");
        int re = 1;
        String value = request.getParameter("value");
        String[] va = value.split("-");
        String name1 = va[0];
        int bookId = Integer.parseInt(va[1]);
        Book book1 = bookService.getBookInfoByBookId(bookId);
        Book book = bookService.getBookByName(name1);
        if((book == null) || (book1.getBookName().equals(name1)))
            re = 2;
        return re;
    }

    @RequestMapping(value = "/checkBookName2.action" )
    public @ResponseBody int checkBookName2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Writer writer = (Writer)session.getAttribute("LoginWriter");
        int re = 1;
        String value = request.getParameter("value");

        Book book = bookService.getBookByName(value);
        if((book == null))
            re = 2;
        return re;
    }
}
