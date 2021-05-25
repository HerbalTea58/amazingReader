package com.amazingReader.control.Chen;

import com.amazingReader.entity.Book;
import com.amazingReader.entity.Reader;
import com.amazingReader.entity.ReaderReadingRecord;
import com.amazingReader.entity.ScoreLevelInformation;
import com.amazingReader.entity.utilEntity.VisitorPermission;
import com.amazingReader.service.Interface.BookService;
import com.amazingReader.service.Interface.ReaderService;
import com.amazingReader.service.Interface.ScoreService;
import com.amazingReader.service.Interface.VisitorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@RequestMapping("/visitor")
@RestController
public class ReaderVisitorPageControl {
    @Autowired
    private ReaderService readerService;
    @Autowired
    private VisitorService visitorService;
    @Autowired
    private BookService bookService;
    @Autowired
    private ScoreService scoreService;

    @RequestMapping("/readerHome.action")
    public void readerHome(HttpServletResponse response, HttpServletRequest request) throws ServletException, IOException {
        int requestReaderId = Integer.parseInt(request.getParameter("readerId"));
        VisitorPermission permission = visitorService.getPermissionSettingOfReader(requestReaderId);
        if(permission == null ||permission.isBookShelf()){
            List<Book> bookShelf = readerService.getBookShelfByReaderId(requestReaderId);
            request.setAttribute("bookShelf",bookShelf);
        }
        if(permission == null ||permission.isReadingRecord()){
            List<ReaderReadingRecord> readingRecords = readerService.getReaderReadingRecord(requestReaderId);
            List<Book> readingRecordBooks = new ArrayList<>();
            for (ReaderReadingRecord record : readingRecords){
                readingRecordBooks.add(bookService.getBookInfoByBookId(record.getBookId()));
            }
            request.setAttribute("readingRecordBooks",readingRecordBooks);
        }
        Reader requestReader = readerService.getReaderInfo(requestReaderId);
        request.setAttribute("requestReader",requestReader);

        //获取用户等级信息
        Integer readerLevel = readerService.getReaderLevel(requestReader.getReaderId());
        ScoreLevelInformation scoreLevelInformation = scoreService.getScoreInformationByScoreLevel(readerLevel + 1);
        Integer withUpperLevel = scoreLevelInformation.getScoreNum() - requestReader.getReaderScore();
        request.setAttribute("readerLevel", readerLevel);
        request.setAttribute("withUpperLevel", withUpperLevel);

        request.getRequestDispatcher("/JSP/readerVisitorPage.jsp").forward(request,response);

    }
}
