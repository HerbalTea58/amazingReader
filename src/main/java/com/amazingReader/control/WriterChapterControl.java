package com.amazingReader.control;

import com.amazingReader.entity.*;
import com.amazingReader.service.Interface.BookService;
import com.amazingReader.service.Interface.ChapterService;
import com.amazingReader.service.Interface.ManagerService;
import com.amazingReader.service.Interface.WriterService;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.json.JSONObject;
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
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@RequestMapping("/Writer")
@Controller
public class WriterChapterControl {
    @Autowired
    private WriterService writerService;
    @Autowired
    private BookService bookService;
    @Autowired
    private ChapterService chapterService;
    @Autowired
    private ManagerService managerService;

    @RequestMapping("/WriterChapterDraft.action")
    public void WriterChapter(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println("+++++++++++++++++"+id);
        HttpSession session = request.getSession();
        Writer writer = (Writer)session.getAttribute("LoginWriter");
        Book book = bookService.getBookInfoByBookId(id);
        List<Draft> draftList = chapterService.getDraftByBookId(id);
        System.out.println("++++++++++"+draftList);
        request.setAttribute("book", book);
        request.setAttribute("draftList", draftList);
        request.getRequestDispatcher("/JSP/writer_addchapter.jsp").forward(request,response);
    }

    @RequestMapping("/WriterChapterBeout.action")
    public void WriterChapterBeout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println("+++++++++++++++++"+id);
        HttpSession session = request.getSession();
        Writer writer = (Writer)session.getAttribute("LoginWriter");
        Book book = bookService.getBookInfoByBookId(id);
        request.setAttribute("book", book);
        List<Chapter> ChapterList = chapterService.getChapters(id);
        request.setAttribute("chapterList", ChapterList);
        request.getRequestDispatcher("/JSP/writer_addchapter_upload.jsp").forward(request,response);
    }

    @RequestMapping("/WriterChapterDelete.action")
    public void WriterChapterDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        HttpSession session = request.getSession();
        Writer writer = (Writer)session.getAttribute("LoginWriter");
        Book book = bookService.getBookInfoByBookId(id);
        request.setAttribute("book", book);
        List<Draft> draftListDelete = chapterService.getDraftByBookIdForDelete(id);
        request.setAttribute("draftListDelete", draftListDelete);
        request.getRequestDispatcher("/JSP/writer_addchapter_delete.jsp").forward(request,response);
    }

    @RequestMapping("/WriterAddChapter.action")
    public void WriterAddChapter(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {
        ChapterCheck chapter = new ChapterCheck();
        HttpSession session = request.getSession();
        Writer writer = (Writer)session.getAttribute("LoginWriter");
        int draftNum = Integer.parseInt(request.getParameter("chapterNum"));
        int id = Integer.parseInt(request.getParameter("id"));
        boolean statu = Boolean.parseBoolean(request.getParameter("select1"));
        String title = request.getParameter("title");
        String main = request.getParameter("main");
//        int num = chapterService.getMaxChapterNumOfBook(id);
        int wordnum = Integer.parseInt(request.getParameter("wordnum"));
        int price = 0;
        if (statu == true){
            price = chapterService.calculatePriceByChapterNum(wordnum);
        }

        Calendar c = Calendar.getInstance();
        c.add(Calendar.DAY_OF_MONTH, -1);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String time1 = formatter.format(c.getTime());

        Date refreshTime = formatter.parse(time1);

        chapter.setCheckChapterFrom(false);
        chapter.setCheckChapterNum(draftNum);
        chapter.setCheckChapterBookId(id);
        chapter.setCheckChapterName(title);
        chapter.setCheckChapterWordNum(wordnum);
        chapter.setCheckChapterPrice(price);
        chapter.setCheckRefreshTime(refreshTime);
        chapter.setCheckChapterStatu(statu);
        chapter.setCheckChapterContent(main);

        ChapterAdditionRemarks chapterAdditionRemarks = new ChapterAdditionRemarks();

            chapter.setCheckChapterAddtion(false);


        chapterService.addChapterCheck(chapter);
//        chapterService.deleteDraftReal(draftNum, id);
        chapterService.upDraft(draftNum, id);
        List<Draft> draftList = chapterService.getDraftByBookId(id);
        request.setAttribute("draftList", draftList);
        Book book = bookService.getBookInfoByBookId(id);
        request.setAttribute("book", book);
        request.getRequestDispatcher("/JSP/writer_addchapter.jsp").forward(request,response);
    }

    @RequestMapping("/WriterSaveDraft.action")
    public void WriterSaveChapter(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {
        String chapterNum = request.getParameter("chapterNum");
        int chapterNum1 = Integer.parseInt(chapterNum);
        int bookid = Integer.parseInt(request.getParameter("id"));
        Draft draft = chapterService.getDraftByBookIdAndDraftNum(bookid, chapterNum1);

        HttpSession session = request.getSession();
        Writer writer = (Writer)session.getAttribute("LoginWriter");
        boolean chapterStatu = Boolean.parseBoolean(request.getParameter("select1"));
        String title = request.getParameter("title");
        String main = request.getParameter("main");


        int wordnum = Integer.parseInt(request.getParameter("wordnum"));
        int price = 0;
        if (chapterStatu == true){
            price = chapterService.calculatePriceByChapterNum(wordnum);
        }
        Calendar c = Calendar.getInstance();
        c.add(Calendar.DAY_OF_MONTH, -1);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String time1 = formatter.format(c.getTime());
//        String strStart = time.substring(0, 10);
        Date editTime = formatter.parse(time1);

        Date draftUploadTime = null;


        draft.setDraftBookId(bookid);
        draft.setDraftChapterName(title);
        draft.setDraftWordNum(wordnum);
        draft.setDraftChapterPrice(price);
        draft.setDraftChapterStatu(chapterStatu);
        draft.setDraftChapterContent(main);
        draft.setDraftEditTime(editTime);
        draft.setDraftUploadTime(draftUploadTime);

        draft.setDraftChapterAdditionCharacter(null);
        draft.setDraftChapterAdditionImg1(null);
        draft.setDraftChapterAdditionImg2(null);
        draft.setDraftChapterAdditionImg3(null);

        draft.setDraftStatu(true);

        if(chapterNum1 == 0){
            int num = 0;
            int num1 = chapterService.getMaxChapterNumOfBook(bookid);
            int num2 = chapterService.getMaxDraftNumOfBook(bookid);
            if(num1>= num2){
                num = num1+1;
            }else {
                num = num2+1;
            }
            chapterService.updateDraft(draft);
            chapterService.updateDraftNum(num, chapterNum1, bookid);
            chapterNum1 = num;
            Draft draft1 = chapterService.getDraftByBookIdAndDraftNum(bookid, num);
            request.setAttribute("draft", draft1);

        }else {
            chapterService.updateDraft(draft);
            request.setAttribute("draft", draft);
        }


        List<Draft> draftList = chapterService.getDraftByBookId(bookid);
        request.setAttribute("draftList", draftList);
        Book book = bookService.getBookInfoByBookId(bookid);
        request.setAttribute("book", book);

        request.setAttribute("chapterNum", chapterNum1);


        request.getRequestDispatcher("/JSP/writer_addchapter.jsp").forward(request,response);
    }

    @RequestMapping("/UpdateChapter.action")
    public void UpdateChapter(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {
        String chapterNum = request.getParameter("chapterNum");
        int chapterNum1 = Integer.parseInt(chapterNum);
        int bookid = Integer.parseInt(request.getParameter("id"));
        ChapterCheck chapter = new ChapterCheck();

        HttpSession session = request.getSession();
        Writer writer = (Writer)session.getAttribute("LoginWriter");

        String title = request.getParameter("title");
        String main = request.getParameter("main");

        boolean chapterStatu = Boolean.parseBoolean(request.getParameter("select1"));

        int wordnum = Integer.parseInt(request.getParameter("wordnum"));

        int price = 0;
        if (chapterStatu == true){
            price = chapterService.calculatePriceByChapterNum(wordnum);
        }
        Calendar c = Calendar.getInstance();
        c.add(Calendar.DAY_OF_MONTH, 0);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String time1 = formatter.format(c.getTime());
        Date editTime = formatter.parse(time1);

        chapter.setCheckChapterFrom(true);
        chapter.setCheckChapterNum(chapterNum1);
        chapter.setCheckChapterBookId(bookid);
        chapter.setCheckChapterName(title);
        chapter.setCheckChapterWordNum(wordnum);
        chapter.setCheckChapterContent(main);
        chapter.setCheckRefreshTime(editTime);
        chapter.setCheckChapterStatu(chapterStatu);
        chapter.setCheckChapterPrice(price);


            chapter.setCheckChapterAddtion(false);

        chapterService.addChapterCheck(chapter);

        List<Chapter> ChapterList = chapterService.getChapters(bookid);
        request.setAttribute("chapterList", ChapterList);
        Book book = bookService.getBookInfoByBookId(bookid);
        request.setAttribute("book", book);
        request.setAttribute("chapterNum", chapterNum1);
        Chapter chapter1 = chapterService.getChapterByChapterNumAndBookId(chapterNum1, bookid);

        request.setAttribute("chapter", chapter1);
        int chaperId = chapterService.getChapterIdBy(bookid, chapterNum1);


        request.getRequestDispatcher("/JSP/writer_addchapter_upload.jsp").forward(request,response);
    }


    @RequestMapping("/DeleteBook.action")
    public @ResponseBody
    boolean DeleteBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        boolean re=false;
        return re;
    }

    @RequestMapping("/GetDraft.action")
    public void GetDraft(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        int chaperNum = Integer.parseInt(request.getParameter("chpaternum"));
        Draft draft = chapterService.getDraftByBookIdAndDraftNum(bookId, chaperNum);
        request.setAttribute("draft", draft);
        System.out.println("??????+++++++++++++"+draft);
        List<Draft> draftList = chapterService.getDraftByBookId(bookId);
        request.setAttribute("draftList", draftList);
        Book book = bookService.getBookInfoByBookId(bookId);
        request.setAttribute("book", book);
        request.setAttribute("chapterNum", chaperNum);
        request.getRequestDispatcher("/JSP/writer_addchapter.jsp").forward(request,response);
    }

    @RequestMapping("/GetDraftDelete.action")
    public void GetDraftDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        int chaperNum = Integer.parseInt(request.getParameter("chpaternum"));
        Draft draft = chapterService.getDraftByBookIdAndDraftNum(bookId, chaperNum);
        request.setAttribute("draft", draft);
        System.out.println("??????+++++++++++++"+draft);
        Book book = bookService.getBookInfoByBookId(bookId);
        request.setAttribute("book", book);
        request.setAttribute("chapterNum", chaperNum);
        List<Draft> draftListDelete = chapterService.getDraftByBookIdForDelete(bookId);
        request.setAttribute("draftListDelete", draftListDelete);

        request.getRequestDispatcher("/JSP/writer_addchapter_delete.jsp").forward(request,response);
    }

    @RequestMapping("/GetDraftUpload.action")
    public void GetDraftUpload(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        int chaperNum = Integer.parseInt(request.getParameter("chpaternum"));
        Chapter chapter = chapterService.getChapterByChapterNumAndBookId(chaperNum, bookId);
        request.setAttribute("chapter", chapter);
        int chaperId = chapterService.getChapterIdBy(bookId, chaperNum);

        System.out.println("??????+++++++++++++"+chapter);
        Book book = bookService.getBookInfoByBookId(bookId);
        request.setAttribute("book", book);
        request.setAttribute("chapterNum", chaperNum);
        List<Chapter> ChapterList = chapterService.getChapters(bookId);
        request.setAttribute("chapterList", ChapterList);

        request.getRequestDispatcher("/JSP/writer_addchapter_upload.jsp").forward(request,response);
    }

    @RequestMapping("/GetDraftSetting.action")
    public void GetDraftSetting(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookId = Integer.parseInt(request.getParameter("id"));
        Book book = bookService.getBookInfoByBookId(bookId);
        BookStyle bookStyle1 = bookService.getBookStyle(book.getBookStyleId());
        BookStyle bookStyle2 = bookService.getFirstStyle(bookStyle1.getBookStyleId());
        request.setAttribute("book",book);
        request.setAttribute("bookStyle1", bookStyle1);
        request.setAttribute("bookStyle2", bookStyle2);
        int num = bookService.getWordsNumOfBook(bookId);
        request.setAttribute("num", num);

        String sub = String.valueOf(bookStyle2.getBookStyleId());
        sub = sub.substring(0,2);
        if(sub.equals("11")){
            List<BookStyle> maleList = bookService.getMaleFirstLabel();
            request.setAttribute("StyleList", maleList);
        }
        if(sub.equals("10")){
            List<BookStyle> femaleList = bookService.getFemaleFirstLabel();
            request.setAttribute("StyleList", femaleList);
        }
        request.getRequestDispatcher("/JSP/writer_addchapter_setting.jsp").forward(request,response);
    }

    @RequestMapping("/BookImgSetting.action")
    public void BookImgSetting(MultipartFile imgFileUp, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookId = Integer.parseInt(request.getParameter("id"));

        String filename = "/book/"+bookId+"/"+imgFileUp.getOriginalFilename();
        String imgFile = request.getServletContext().getRealPath("image");
        String img = imgFile+filename;
        File file = new File(img);
        File pfile = file.getParentFile();
        if(!pfile.exists()){
            pfile.mkdirs();
            file.createNewFile();
        }else {
            if(!file.exists()){
                file.createNewFile();
            }else{
                file.delete();
                file.createNewFile();
            }
        }
        imgFileUp.transferTo(file);
        bookService.updatePic(bookId, "image"+filename);

        Book book = bookService.getBookInfoByBookId(bookId);
        request.setAttribute("book", book);
        request.getRequestDispatcher("/JSP/writer_addchapter_setting.jsp").forward(request,response);
    }

    @RequestMapping("/WriterNewDraft.action")
    public void WriterNewDraft(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {
        Draft draft = new Draft();
        int bookid = Integer.parseInt(request.getParameter("id"));
        int draftNum = 0;

        chapterService.deleteDraftReal(0, bookid);
        HttpSession session = request.getSession();
        Writer writer = (Writer)session.getAttribute("LoginWriter");

        boolean chapterStatu = false;
        String title = "?????????";
        String main = "<p><br></p>";


        int wordnum = 0;
        int price = 0;

        Calendar c = Calendar.getInstance();
        c.add(Calendar.DAY_OF_MONTH, -1);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String time1 = formatter.format(c.getTime());
        Date editTime = formatter.parse(time1);

        Date draftUploadTime = null;

        draft.setDraftChapterNum(draftNum);
        draft.setDraftBookId(bookid);
        draft.setDraftChapterName(title);
        draft.setDraftWordNum(wordnum);
        draft.setDraftChapterPrice(price);
        draft.setDraftChapterStatu(chapterStatu);
        draft.setDraftChapterContent(main);
        draft.setDraftEditTime(editTime);
        draft.setDraftUploadTime(draftUploadTime);

        draft.setDraftChapterAddition(false);
        draft.setDraftChapterAdditionCharacter(null);
        draft.setDraftChapterAdditionImg1(null);
        draft.setDraftChapterAdditionImg2(null);
        draft.setDraftChapterAdditionImg3(null);

        draft.setDraftStatu(true);
        chapterService.addDraft(draft);

        List<Draft> draftList = chapterService.getDraftByBookId(bookid);
        Book book = bookService.getBookInfoByBookId(bookid);
        request.setAttribute("book", book);
        request.setAttribute("draftList", draftList);
        request.setAttribute("draft", draft);
        request.setAttribute("chapterNum", draftNum);
        List<Draft> draftListDelete = chapterService.getDraftByBookIdForDelete(bookid);
        request.setAttribute("draftListDelete", draftListDelete);
        request.getRequestDispatcher("/JSP/writer_addchapter.jsp").forward(request,response);
    }

    @RequestMapping("/DeleteDraft.action")
    public void DeleteDraft(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        int chaperNum = Integer.parseInt(request.getParameter("chapterNum"));
        chapterService.deleteDraft(chaperNum, bookId);
        Book book = bookService.getBookInfoByBookId(bookId);
        request.setAttribute("book", book);
        request.setAttribute("chapterNum", chaperNum);
        List<Draft> draftListDelete = chapterService.getDraftByBookIdForDelete(bookId);
        request.setAttribute("draftListDelete", draftListDelete);

        request.getRequestDispatcher("/JSP/writer_addchapter_delete.jsp").forward(request,response);
    }

    @RequestMapping("/ReDraft.action")
    public void ReDraft(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        int chaperNum = Integer.parseInt(request.getParameter("chpateNum"));
        chapterService.reDraft(chaperNum, bookId) ;
        Book book = bookService.getBookInfoByBookId(bookId);
        request.setAttribute("book", book);
        request.setAttribute("chapterNum", chaperNum);
        List<Draft> draftListDelete = chapterService.getDraftByBookIdForDelete(bookId);
        request.setAttribute("draftListDelete", draftListDelete);

        request.getRequestDispatcher("/JSP/writer_addchapter.jsp").forward(request,response);
    }

    @RequestMapping("/BookSettingChange.action")
    public void BookSettingChange(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookId = Integer.parseInt(request.getParameter("id"));
        String bookName = request.getParameter("bookName");
        int styleId = Integer.parseInt(request.getParameter("style"));
        String bookDc = request.getParameter("bookDc");

        Book book = bookService.getBookInfoByBookId(bookId);
        book.setBookName(bookName);
        book.setBookStyleId(styleId);
        book.setBookShortDescribe(bookDc);

        bookService.alterBook(book);

        Book book1 = bookService.getBookInfoByBookId(bookId);
        BookStyle bookStyle1 = bookService.getBookStyle(book.getBookStyleId());
        BookStyle bookStyle2 = bookService.getFirstStyle(bookStyle1.getBookStyleId());
        request.setAttribute("book",book1);
        request.setAttribute("bookStyle1", bookStyle1);
        request.setAttribute("bookStyle2", bookStyle2);
        int num = bookService.getWordsNumOfBook(bookId);
        request.setAttribute("num", num);
        request.getRequestDispatcher("/JSP/writer_addchapter_setting.jsp").forward(request,response);
    }


    @RequestMapping("/AutoSaveDraft.action")
    public void AutoSaveDraft(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {
        String chapterNum = request.getParameter("chapterNum");
        int chapterNum1 = Integer.parseInt(chapterNum);
        int bookid = Integer.parseInt(request.getParameter("id"));
        Draft draft = chapterService.getDraftByBookIdAndDraftNum(bookid, chapterNum1);

        HttpSession session = request.getSession();
        Writer writer = (Writer)session.getAttribute("LoginWriter");
        boolean chapterStatu = Boolean.parseBoolean(request.getParameter("select1"));
        String title = request.getParameter("title");
        String main = request.getParameter("main");

        int wordnum = Integer.parseInt(request.getParameter("wordnum"));
        int price = 0;
        if (chapterStatu == true){
            price = chapterService.calculatePriceByChapterNum(wordnum);
        }
        Calendar c = Calendar.getInstance();
        c.add(Calendar.DAY_OF_MONTH, -1);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String time1 = formatter.format(c.getTime());
//        String strStart = time.substring(0, 10);
        Date editTime = formatter.parse(time1);

        Date draftUploadTime = null;


        draft.setDraftBookId(bookid);
        draft.setDraftChapterName(title);
        draft.setDraftWordNum(wordnum);
        draft.setDraftChapterPrice(price);
        draft.setDraftChapterStatu(chapterStatu);
        draft.setDraftChapterContent(main);
        draft.setDraftEditTime(editTime);
        draft.setDraftUploadTime(draftUploadTime);


            draft.setDraftChapterAddition(false);
            draft.setDraftChapterAdditionCharacter(null);
            draft.setDraftChapterAdditionImg1(null);
            draft.setDraftChapterAdditionImg2(null);
            draft.setDraftChapterAdditionImg3(null);

        draft.setDraftStatu(true);


        chapterService.updateDraft(draft);
        request.setAttribute("draft", draft);


        List<Draft> draftList = chapterService.getDraftByBookId(bookid);
        Book book = bookService.getBookInfoByBookId(bookid);
        request.setAttribute("book", book);
        request.setAttribute("draftList", draftList);
        request.setAttribute("chapterNum", chapterNum1);

        request.getRequestDispatcher("/JSP/writer_addchapter.jsp").forward(request,response);
    }
}
