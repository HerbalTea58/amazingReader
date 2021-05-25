package com.amazingReader.control.Chen;

import com.amazingReader.entity.*;
import com.amazingReader.service.Interface.*;
import com.sun.org.apache.regexp.internal.RE;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Random;

@RequestMapping("/comment")
@RestController
public class CommentControl {
    @Autowired
    private CommentService commentService;
    @Autowired
    private BookService bookService;
    @Autowired
    private ChapterService chapterService;
    @Autowired
    private ReaderService readerService;
    @Autowired
    private WriterService writerService;

    @RequestMapping("/like.action")
    public boolean like(HttpServletRequest request ,HttpServletResponse response){
        Integer commentId = Integer.parseInt(request.getParameter("commentId"));
        Reader reader = (Reader)request.getSession().getAttribute("reader");
        return commentService.like(commentId,reader.getReaderId());
    }

    @RequestMapping("/chapterComment.action")
    public void getChapterComment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int chapterId = Integer.parseInt(request.getParameter("chapterId"));
        Book book = bookService.getBookInfoByChapterId(chapterId);
        Reader reader = (Reader)request.getSession().getAttribute("reader");
        Chapter chapter = chapterService.getChapter(chapterId);
        Writer writer = writerService.getWriterInfo(book.getBookWriterId());
        request.setAttribute("writer",writer);
        request.setAttribute("book",book);
        List<Comment> comments = commentService.getAllPostOf(chapterId);
        for (Comment comment : comments){
            comment.setReplyNum(commentService.getAllCommentsOfPost(comment.getCommentTid()).size());
            if(reader != null)
                comment.setAmILiked(commentService.getCommentLikeRecord(comment.getCommentId(),reader.getReaderId())==null?false:true);
        }
        request.setAttribute("posts",comments);
        request.setAttribute("chapter",chapter);
        request.getRequestDispatcher("/JSP/postPage.jsp").forward(request,response);
    }

    @RequestMapping("/comments.action")
    public void getComments(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int tId= Integer.parseInt(request.getParameter("tId"));
        Reader reader = (Reader)request.getSession().getAttribute("reader");
        Comment post = commentService.getPost(tId);
        Book book = bookService.getBookInfoByBookId(chapterService.getChapter(post.getCommentChapterId()).getChapterBookId());
        request.setAttribute("book",book);
        request.setAttribute("post",post);
        List<Comment> comments = commentService.getAllCommentsOfPost(tId);
        for (Comment comment : comments){
            comment.setCommentedReader(readerService.getReaderInfo(comment.getCommentCommentedId()));
            if(reader != null)
                comment.setAmILiked(commentService.getCommentLikeRecord(comment.getCommentId(),reader.getReaderId())==null?false:true);
        }
        request.setAttribute("comments",comments);
        request.getRequestDispatcher("/JSP/commentPage.jsp").forward(request,response);
    }

    @RequestMapping("/myPost.action")
    public List<Comment> getMyPosts(HttpServletRequest request, HttpServletResponse response){
        int readerId = ((Reader)request.getSession().getAttribute("reader")).getReaderId();
        return readerService.getPostsSendBy(readerId);
    }

    @RequestMapping("/myComments.action")
    public List<Comment> getMyComments(HttpServletRequest request, HttpServletResponse response){
        int readerId = ((Reader)request.getSession().getAttribute("reader")).getReaderId();
        return readerService.getCommentsSendBy(readerId);
    }

    @RequestMapping("/pushPost.action")
    public void pushPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        String postContent = request.getParameter("content");
        Integer chapterId = Integer.parseInt(request.getParameter("chapterId"));
        Integer bookId = Integer.parseInt(request.getParameter("bookId"));
        Reader reader = (Reader)request.getSession().getAttribute("reader");
        Comment post = new Comment();
            post.setCommentCommentedId(-1);
            post.setCommentBookId(bookId);
            post.setCommentChapterId(chapterId);
            post.setCommentContent(postContent);
            post.setCommentIsRead(false);
            post.setCommentPushDate(new Date());
            post.setCommentReaderId(reader.getReaderId());
        commentService.post(post);
        response.sendRedirect("chapterComment.action?chapterId="+chapterId);
    }

    @RequestMapping("/pushComment.action")
    public void pushComment(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        String postContent = request.getParameter("content");
        Integer chapterId = Integer.parseInt(request.getParameter("chapterId"));
        Integer bookId = Integer.parseInt(request.getParameter("bookId"));
        Integer commentedReaderId = Integer.parseInt(request.getParameter("commentedReaderId"));
        Integer tId = Integer.parseInt(request.getParameter("tId"));
        Reader reader = (Reader)request.getSession().getAttribute("reader");
        Comment comment = new Comment();
            comment.setCommentCommentedId(commentedReaderId);
            comment.setCommentTid(tId);
            comment.setCommentBookId(bookId);
            comment.setCommentChapterId(chapterId);
            comment.setCommentContent(postContent);
            comment.setCommentIsRead(false);
            comment.setCommentPushDate(new Date());
            comment.setCommentReaderId(reader.getReaderId());
        commentService.comment(comment);
        response.sendRedirect("comments.action?tId="+tId);
    }

    /**
     * 一并删除帖子下面的评论
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/removePost.action")
    public boolean removePost(HttpServletRequest request ,HttpServletResponse response){
        Integer tId = Integer.parseInt(request.getParameter("tId"));
        System.out.println("\n\n\n\n\n\n" + tId);
        return commentService.removePost(tId);
    }

    /**
     * 删除一条评论
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/removeComment.action")
    public boolean removeComment(HttpServletRequest request ,HttpServletResponse response){
        Integer commentId = Integer.parseInt(request.getParameter("commentId"));
        return commentService.removeComment(commentId);
    }

    @RequestMapping("/reportComment.action")
    public boolean  reportComment(HttpServletRequest request ,HttpServletResponse response){
        Integer commentId = Integer.parseInt(request.getParameter("commentId"));
        Integer typeId = Integer.parseInt(request.getParameter("typeId"));
        Reader reader = (Reader)request.getSession().getAttribute("reader");
        ReportComment reportComment = new ReportComment();
            reportComment.setReportStatuId(1);
            reportComment.setReaderId(reader.getReaderId());
            reportComment.setCommentId(commentId);
            reportComment.setReportTime(new Date());
            reportComment.setReportTypeId(typeId);
            reportComment.setReportManagerId(1);/*待修改随机分配管理员*/
        return readerService.reportComment(reportComment);
    }
}
