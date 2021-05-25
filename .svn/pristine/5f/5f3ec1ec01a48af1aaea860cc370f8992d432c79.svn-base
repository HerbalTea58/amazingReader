package com.amazingReader.control.Gao;

import com.amazingReader.entity.Reader;
import com.amazingReader.service.Interface.CommentService;
import com.amazingReader.service.Interface.ReaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.stream.events.Comment;
import java.util.List;

@RequestMapping("/comment")
@RestController
public class updateCommentStatusControl {
    @Autowired
    private CommentService commentService;
    @Autowired
    private ReaderService readerService;
    @RequestMapping("/updateCommentStatus.action")
    public  Boolean updateCommentStatus(int[] commentIdlist,HttpServletRequest request, HttpServletResponse response) {
        Reader reader1 = (Reader) request.getSession().getAttribute("reader");
        Reader reader=new Reader();
        if (reader1!=null) {
            reader = readerService.getReaderInfo(reader1.getReaderId());
        }
        if (commentIdlist.length > 0) {
            for (Integer commentId : commentIdlist) {
                commentService.alterStatu(commentId, true);
            }
            return true;
        }
        return false;
    }
}
