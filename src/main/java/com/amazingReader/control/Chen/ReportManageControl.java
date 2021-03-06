package com.amazingReader.control.Chen;

import com.amazingReader.entity.*;
import com.amazingReader.mapper.ReaderMapper;
import com.amazingReader.service.Interface.*;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@RequestMapping("/manager")
@RestController
public class ReportManageControl {
    @Autowired
    private ManagerService managerService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private ChapterService chapterService;
    @Autowired
    private ReportService reportService;
    @Autowired
    private ReaderService readerService;
    @Autowired
    private BookService bookService;

/*    @Autowired
    private ReaderService readerService;*/


    @RequestMapping("/login.action")
    public void login(Manager manager, HttpServletResponse response, HttpServletRequest request) throws IOException, ServletException {
        //manager.setManagerNeckname(request.getParameter("managerId"));
        System.out.println("\n\n"+manager.getManagerNeckname()+manager.getManagerPassword()+"============");
        String ck=request.getParameter("rem");


        int flag = managerService.login(manager);
        int flag1=flag;
        //通过昵称或者id 得到该管理员的账户信息
        Manager myManager=new Manager();
        if (flag==0){
            myManager=managerService.getManagerInfo(Integer.parseInt(manager.getManagerNeckname()));
        }else if(flag==4){
          myManager=managerService.getManagerInfo(manager.getManagerNeckname());
        }
        /*request.setAttribute("flag",flag);*/
        //System.out.println("\n\n"+myManager.getManagerNeckname()+","+myManager.getManagerPortrait());
        if (flag == 0 || flag==4) {

            //登陆成功 创建会话对象
            request.getSession().setAttribute("manager", myManager);
            request.getSession().setAttribute("reader",readerService.getReaderInfo(25));

            //设置cookie
            Cookie[] cookies = request.getCookies();
            if ("checked".equals(ck)) {
                boolean f = false;
                if (cookies != null) {
                    for (int i = 0; i < cookies.length; i++) {
                        if (cookies[i].getName().equals("managerloginInfo")) {
                            f = true;
                            break;
                        }
                    }
                    if (!f) {
                        // 构造Cookie对象
                        Cookie cookie = new Cookie("managerloginInfo", manager.getManagerNeckname() + "-" + manager.getManagerPassword());
                        // 设置过期时间
                        cookie.setMaxAge(60 * 60);
                        // 存储
                        cookie.setPath("/");

                        response.addCookie(cookie);
                    }


                }
            }
            //response.sendRedirect(request.getContextPath() + "/JSP/managerPage.jsp");
           response.sendRedirect(request.getContextPath()+"/JSP/managerPage.jsp");

        } else {
            request.setAttribute("managerName",manager.getManagerNeckname());
            request.getRequestDispatcher("/JSP/managerLogin.jsp?flag="+flag).forward(request,response);

        }


    }

    @RequestMapping("/getAllCommentReport.action") //获得全部评论举报
    public void queryAllChapter(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        //得到当前管理员session的managerId
        Manager managerTrue=(Manager)request.getSession().getAttribute("myManager");
        int managerId=managerTrue.getManagerId();
        //拿到当前管理员的全部章节举报
        List<ReportComment> commentList=commentService.getAllReportComment(managerId);
        request.setAttribute("commentList",commentList);
        request.getRequestDispatcher("/JSP/managerPage.jsp").forward(request,response);

    }
    @RequestMapping("/getAllChapterReport.action") //获得全部章节举报
    public void queryAllChapterReport(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        //得到当前管理员session的managerId
        Manager managerTrue=(Manager)request.getSession().getAttribute("myManager");
        int managerId=managerTrue.getManagerId();
        //拿到当前管理员的全部章节举报
        List<ReportChapter> chapterList=chapterService.getAllReportedChapter(managerId);
        request.setAttribute("chapterList",chapterList);
        request.getRequestDispatcher("/JSP/managerPage.jsp").forward(request,response);
    }

    @RequestMapping("/getCommentsToDeal.action") //获得未处理评论举报
    public void queryAllCommentsToDeal(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        //得到当前管理员session的managerId
        Manager managerTrue=(Manager)request.getSession().getAttribute("myManager");
        int managerId=managerTrue.getManagerId();
        //拿到该管理员的未处理评论
        List<ReportComment> commentListToDeal=commentService.getToDealReportComment(managerId);
        request.setAttribute("commentList",commentListToDeal);
        request.getRequestDispatcher("/JSP/managerPage.jsp").forward(request,response);
    }


    @RequestMapping("/getChaptersToDeal.action")
    public void queryAllChaptersToDeal(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        //得到当前管理员session的managerId
        Manager managerTrue=(Manager)request.getSession().getAttribute("myManager");
        int managerId=managerTrue.getManagerId();
        //拿到该管理员的未处理评论
        List<ReportChapter> chapterListToDeal=chapterService.getToDealReportedChapter(managerId);
        request.setAttribute("chapterList",chapterListToDeal);
        request.getRequestDispatcher("/JSP/managerPage.jsp").forward(request,response);
    }


    @RequestMapping("/deleteComment.action")
    public void deleteComment(HttpServletRequest request,HttpServletResponse response){
        Integer commentId=Integer.parseInt(request.getParameter("commentId"));
        Integer reportId=Integer.parseInt(request.getParameter("reportId"));

        //对该举报信息和被举报评论做出处理
        reportService.removeReportComment(reportId,commentId);
    }

    @RequestMapping("/refuseReportComment.action")
    public void refuseReportComment(HttpServletRequest request,HttpServletResponse response){
        Integer reportId = Integer.parseInt(request.getParameter("reportId"));
        reportService.refuseReportComment(reportId);
    }

    @RequestMapping("/refuseReportChapter.action")
    public void refuseReportChapter(HttpServletRequest request,HttpServletResponse response){
        Integer reportId = Integer.parseInt(request.getParameter("reportId"));
        reportService.refuseReportChapter(reportId);
    }

    @RequestMapping("/isNeckNameExist.action")
    public void checkName(HttpServletResponse response, HttpServletRequest request){
        String name = request.getParameter("name");
        try {
        PrintWriter pw = response.getWriter();
        if(name != null && managerService.getManagerInfo(((Manager)request.getSession().getAttribute("manager")).getManagerId()) != null){
                pw.write("true");
                return;
        }
        pw.write("false");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }



/*    @RequestMapping("/getAllReportComment.action")
    public List<ReportComment> getAllReportComment(HttpServletRequest request) throws IOException {
//        Manager manager = (Manager) request.getSession().getAttribute("manager");
        Manager manager = new Manager();
        manager.setManagerId(1);
        manager.setManagerNeckname("男：历史");
        manager.setManagerPassword("123");

        return commentService.getAllReportComment(manager.getManagerId());
    }
    @RequestMapping("/getAllReportedChapter.action")
    public List<ReportChapter> getAllReportedChapter(HttpServletRequest request){
        Manager manager = new Manager();
        manager.setManagerId(1);
        manager.setManagerNeckname("男：历史");
        manager.setManagerPassword("123");

        return chapterService.getAllReportedChapter(manager.getManagerId());
    }*/

    @RequestMapping("/getToDealReportComment.action")
    public void getToDealReportComment(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        Manager manager = (Manager) request.getSession().getAttribute("manager");
        List<ReportComment> comments = commentService.getToDealReportComment(manager.getManagerId());
        request.setAttribute("reportComments",comments);
        List<BookStyle> styles = bookService.getStylesNameLike("");
        //获得女频书籍的一级类别
        List<BookStyle> womanStyles=bookService.getFemaleFirstLabel();
        request.setAttribute("womanStyles",womanStyles);
        //获得男频书籍的一级类别
        List<BookStyle> manStyles=bookService.getMaleFirstLabel();
        request.setAttribute("manStyles",manStyles);
        request.getRequestDispatcher("/JSP/managerDealCommentReportPage.jsp").forward(request,response);
    }
    @RequestMapping("/getToDealReportChapter.action")
    public void getToDealReportedChapter(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        Manager manager = (Manager) request.getSession().getAttribute("manager");
        List<ReportChapter> reportChapters = chapterService.getToDealReportedChapter(manager.getManagerId());
        request.setAttribute("reportChapters",reportChapters);
        List<BookStyle> styles = bookService.getStylesNameLike("");
        //获得女频书籍的一级类别
        List<BookStyle> womanStyles=bookService.getFemaleFirstLabel();
        request.setAttribute("womanStyles",womanStyles);
        //获得男频书籍的一级类别
        List<BookStyle> manStyles=bookService.getMaleFirstLabel();
        request.setAttribute("manStyles",manStyles);
        request.getRequestDispatcher("/JSP/managerDealChapterReportPage.jsp").forward(request,response);
    }

    @RequestMapping("/getUserReportedTimes.action")
    public void getUserReportedTimes(HttpServletRequest request,HttpServletResponse response){
    }

}
