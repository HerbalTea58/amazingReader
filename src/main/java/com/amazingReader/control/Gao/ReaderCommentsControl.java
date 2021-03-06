package com.amazingReader.control.Gao;

import com.amazingReader.entity.Book;
import com.amazingReader.entity.Comment;
import com.amazingReader.entity.Commentabmin;
import com.amazingReader.entity.Reader;
import com.amazingReader.service.Interface.BookService;
import com.amazingReader.service.Interface.ChapterService;
import com.amazingReader.service.Interface.ReaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@RequestMapping("readercomment")
@RestController
public class ReaderCommentsControl {
    @Autowired
    private ReaderService readerService;
    @Autowired
    private BookService bookService;
    @Autowired
    private ChapterService chapterService;
    @RequestMapping("/Readercomments.action")
    public void getReaderComments(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Reader reader1=(Reader)request.getSession().getAttribute("reader");
        Reader reader=new Reader();
        if (reader1!=null) {
            reader = readerService.getReaderInfo(reader1.getReaderId());
        }
        List<Comment> commentList=readerService.getCommentsSendBy(reader.getReaderId());
        List<Commentabmin> commentabminList=new ArrayList<Commentabmin>();
        for (Comment comment:commentList){
             int bookId=comment.getCommentBookId();
             Book book=bookService.getBookInfoByBookId(bookId);
             Commentabmin commentabmin=new Commentabmin();
             commentabmin.setCommentBookId(comment.getCommentBookId());
             commentabmin.setCommentChapter(chapterService.getChapter(comment.getCommentChapterId()));
             commentabmin.setCommentContent(comment.getCommentContent());
             commentabmin.setCommentTid(comment.getCommentTid());
             commentabmin.setCommentedReader(comment.getCommentedReader());
             commentabmin.setCommentPushDate(comment.getCommentPushDate());
             commentabmin.setCommentReaderId(comment.getCommentReaderId());
             commentabmin.setCommentBookId(comment.getCommentBookId());
            commentabmin.setCommentCommentedId(comment.getCommentChapterId());
            commentabmin.setCommentId(comment.getCommentId());
             commentabmin.setBook(book);
            Reader replyreader=readerService.getReaderInfo(comment.getCommentCommentedId());
            commentabmin.setReplyreader(replyreader);
             commentabminList.add(commentabmin);
         }
        List<Comment> commentList1=readerService.readCommentsTo(reader.getReaderId());
        List<Commentabmin> commentabminList1=new ArrayList<Commentabmin>();
        for (Comment comment:commentList1){
            int bookId=comment.getCommentBookId();
            Book book=bookService.getBookInfoByBookId(bookId);
            Commentabmin commentabmin=new Commentabmin();
            commentabmin.setCommentBookId(comment.getCommentBookId());
            commentabmin.setCommentChapter(chapterService.getChapter(comment.getCommentChapterId()));
            commentabmin.setCommentContent(comment.getCommentContent());
            commentabmin.setCommentedReader(comment.getCommentedReader());
            commentabmin.setCommentTid(comment.getCommentTid());
            commentabmin.setCommentPushDate(comment.getCommentPushDate());
            commentabmin.setCommentReaderId(comment.getCommentReaderId());
            commentabmin.setCommentBookId(comment.getCommentBookId());
            commentabmin.setCommentId(comment.getCommentId());
            commentabmin.setCommentCommentedId(comment.getCommentCommentedId());
            commentabmin.setCommentCommentedId(comment.getCommentChapterId());
            commentabmin.setBook(book);
            Reader replyreader=readerService.getReaderInfo(comment.getCommentReaderId());
            commentabmin.setReplyreader(replyreader);
            commentabminList1.add(commentabmin);
        }
         List<Comment> commentList2=readerService.getPostsSendBy(reader.getReaderId());
         List<Commentabmin> commentabminList2=new ArrayList<Commentabmin>();
            for (Comment comment:commentList2){
            int bookId=comment.getCommentBookId();
            Book book=bookService.getBookInfoByBookId(bookId);
            Commentabmin commentabmin=new Commentabmin();
            commentabmin.setCommentBookId(comment.getCommentBookId());
            commentabmin.setCommentChapter(chapterService.getChapter(comment.getCommentChapterId()));
            commentabmin.setCommentContent(comment.getCommentContent());
            commentabmin.setCommentCommentedId(comment.getCommentCommentedId());
            commentabmin.setCommentedReader(comment.getCommentedReader());
            commentabmin.setCommentId(comment.getCommentId());
            commentabmin.setCommentPushDate(comment.getCommentPushDate());
            commentabmin.setCommentTid(comment.getCommentTid());
            commentabmin.setCommentReaderId(comment.getCommentReaderId());
            commentabmin.setCommentBookId(comment.getCommentBookId());
            commentabmin.setCommentCommentedId(comment.getCommentChapterId());
            commentabmin.setBook(book);
            commentabminList2.add(commentabmin);
        }
        request.setAttribute("commentabminList1",commentabminList1);
        request.setAttribute("reader",reader);
        request.setAttribute("commentabminList",commentabminList);
        request.setAttribute("commentabminList2",commentabminList2);
        request.getRequestDispatcher("/JSP/comment2.jsp").forward(request,response);
    }

}
