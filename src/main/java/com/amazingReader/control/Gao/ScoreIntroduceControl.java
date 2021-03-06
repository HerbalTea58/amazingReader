package com.amazingReader.control.Gao;

import com.amazingReader.entity.Reader;
import com.amazingReader.entity.ScoreLevelInformation;
import com.amazingReader.service.Interface.ReaderService;
import com.amazingReader.service.Interface.ScoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@RequestMapping("/score")
@Controller
public class ScoreIntroduceControl {
    @Autowired
    private ScoreService scoreService;
    @Autowired
    private ReaderService readerService;
    @RequestMapping("/scoreintroduce.action")
    public void getScoreInformation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ScoreLevelInformation> scoreLevelInformationList= scoreService.getAllScoreInformation();
        request.setAttribute("scoreLevelInformationList",scoreLevelInformationList);
        request.getRequestDispatcher("/JSP/scoreintroduce.jsp").forward(request,response);
    }
    @RequestMapping("/personalscore.action")
    public void getPersonalScore(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        Reader reader1=(Reader)request.getSession().getAttribute("reader");
        Reader reader=new Reader();
        if (reader1!=null) {
            reader = readerService.getReaderInfo(reader1.getReaderId());
        }
        int score=reader.getReaderScore();
        int scorelevel=readerService.getReaderLevel(reader.getReaderId());
        ScoreLevelInformation scoreLevelInformationnext=scoreService.getScoreInformationByScoreLevel(scorelevel+1);
        request.setAttribute("reader", reader);
        request.setAttribute("score",score);
        request.setAttribute("scorelevel",scorelevel);
        request.setAttribute("scoreLevelInformationnext",scoreLevelInformationnext);
        request.getRequestDispatcher("/JSP/score.jsp").forward(request,response);
    }
}
