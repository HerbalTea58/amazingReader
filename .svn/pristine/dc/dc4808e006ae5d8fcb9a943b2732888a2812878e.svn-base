package com.amazingReader.control.Chen;

import com.amazingReader.entity.ChapterCheck;
import com.amazingReader.entity.Writer;
import com.amazingReader.service.Interface.ChapterService;
import com.amazingReader.service.Interface.ToCheckChapterManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@RequestMapping("/manager")
@Controller
public class ToCheckChapterManageControl {
    @Autowired
    private ToCheckChapterManageService toCheckChapterManageService;
    @Autowired
    private ChapterService chapterService;

        @RequestMapping("/toCheckChaptersManage.action")
    public void toCheckChaptersManage(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
        List<Writer> writerList = toCheckChapterManageService.getAllInfoOfWriterAndToCheckChapters();
        request.setAttribute("writerList",writerList);
        request.getRequestDispatcher("/JSP/manageToCheckChapter.jsp").forward(request,response);
    }

    @RequestMapping("/upShelfToChapters.action")
    public void upShelfToChapters(Integer bookId,Integer chapterNum,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        chapterService.add(chapterNum,bookId);
//        request.getRequestDispatcher("/toCheckChaptersManage.action").forward(request,response);
    }

    @RequestMapping("/refuseChapter.action")
    public void refuseChapter(Integer bookId,Integer chapterNum,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        chapterService.refuseChaper(chapterNum,bookId);
//        request.getRequestDispatcher("/toCheckChaptersManage.action").forward(request,response);
    }

    @RequestMapping("/alterChapterInShelf.action")
    public void alterChapterInShelf(Integer bookId,Integer chapterNum,HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        chapterService.alterChapter(chapterNum,bookId);
//        request.getRequestDispatcher("/toCheckChaptersManage.action").forward(request,response);

    }
    @RequestMapping("/readCheckChapter.action")
    public void readCheckChapter(Integer bookId,Integer chapterNum,HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        ChapterCheck chapterCheck = chapterService.getToCheckChapter(bookId,chapterNum);
        request.setAttribute("chapterCheck",chapterCheck);
        request.getRequestDispatcher("/JSP/managerReadingToCheckChapterPage.jsp").forward(request,response);
    }
}
