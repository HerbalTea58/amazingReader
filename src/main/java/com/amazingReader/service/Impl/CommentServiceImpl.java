package com.amazingReader.service.Impl;

import java.util.List;

import com.amazingReader.entity.Reader;
import com.amazingReader.entity.ReportComment;
import com.amazingReader.mapper.*;
import org.springframework.beans.factory.annotation.Autowired;

import com.amazingReader.entity.Comment;
import com.amazingReader.entity.CommentLikeRecord;
import com.amazingReader.service.Interface.CommentService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CommentServiceImpl implements CommentService {
	@Autowired
	private CommentMapper commentMapper;
	@Autowired
	private CommentLikeRecordMapper commentLikeRecordMapper;
	@Autowired
	private ChapterMapper chapterMapper;
	@Autowired
	private ReportCommentMapper reportCommentMapper;
	@Autowired
	private ReaderMapper readerMapper;
	@Override
	public boolean comment(Comment comment) {
		return commentMapper.add(comment);
	}

	@Override
	public boolean like(int commentId,int readerId) {
		CommentLikeRecord like = new CommentLikeRecord();
		like.setCommentID(commentId);
		like.setReaderID(readerId);
		if(commentLikeRecordMapper.isLiked(readerId, commentId) == 0){
			commentLikeRecordMapper.addCommentLike(like);
			return true;
		}else{
			commentLikeRecordMapper.removeCommentLike(like);
			return false;
		}
	}

	@Override
	public boolean removeComment(int commentId) {
		return commentMapper.removeByCommentId(commentId);
	}

	@Override
	public boolean post(Comment post) {
		post.setCommentTid(commentMapper.getMaxTID()+1);
		return commentMapper.add(post);
	}

	@Transactional(propagation= Propagation.REQUIRED,isolation = Isolation.DEFAULT)
	@Override
	public List<Comment> getAllPostOf(int chapterId) {
		List<Comment> comments = commentMapper.getTieZiByChapterId(chapterId);
		for(Comment comment : comments){
			comment.setReader(readerMapper.getReader(comment.getCommentReaderId()));
			comment.setCommentLikeNum(commentLikeRecordMapper.getLikeNumOfComment(comment.getCommentId()));
		}
		return comments;
	}

	@Transactional(propagation= Propagation.REQUIRED,isolation = Isolation.DEFAULT)
	@Override
	public List<Comment> getAllPostOf(int bookId, int chapterNum) {
		int chapterId = chapterMapper.getChapterIdBy(bookId, chapterNum);
		return commentMapper.getTieZiByChapterId(chapterId);
	}

	@Transactional(propagation= Propagation.REQUIRED,isolation = Isolation.DEFAULT)
	@Override
	public List<Comment> getAllCommentsOfPost(int tId) {
		List<Comment> comments = commentMapper.getCommentsByTieZiId(tId);
		for(Comment comment : comments){
			comment.setCommentedReader(readerMapper.getReader(comment.getCommentCommentedId()));
			comment.setReader(readerMapper.getReader(comment.getCommentReaderId()));
			comment.setCommentLikeNum(commentLikeRecordMapper.getLikeNumOfComment(comment.getCommentId()));
		}
		return comments;
	}

	@Transactional(propagation= Propagation.REQUIRED,isolation = Isolation.DEFAULT)
	@Override
	public List<ReportComment> getAllReportComment(int managerId) {
		List<ReportComment> reportComments = reportCommentMapper.getBymanagerId(managerId);
		for (ReportComment reportComment : reportComments){
			reportComment.setReportedComment(
					commentMapper.getCommentBy(
							reportComment.getCommentId()
					)
			);
			Reader reportedReader = readerMapper.getReader(
					commentMapper.getCommentBy(
							reportComment.getCommentId()
					).getCommentReaderId()
			);
			reportedReader.setReportedTimes(getReaderAndReportedTimes(reportedReader.getReaderId()));
			reportComment.setReportReader(reportedReader);
		}
		return reportComments;
	}

	@Override
	public List<ReportComment> getToDealReportComment(int managerId) {
		List<ReportComment> reportComments = reportCommentMapper.getToDealReportCommentByManagerId(managerId);
		for (ReportComment reportComment : reportComments){
			reportComment.setReportedComment(
					commentMapper.getWidelyCommentBy(
							reportComment.getCommentId()
					)
			);
			Reader reportedReader = readerMapper.getReader(
					commentMapper.getWidelyCommentBy(
							reportComment.getCommentId()
					).getCommentReaderId()
			);
			reportedReader.setReportedTimes(getReaderAndReportedTimes(reportedReader.getReaderId()));
			reportComment.setReportReader(reportedReader);
		}
		return reportComments;
	}

	@Transactional(propagation= Propagation.REQUIRED,isolation = Isolation.DEFAULT)
	@Override
	public Comment getCommentById(int commentId) {
		Comment comment = commentMapper.getCommentBy(commentId);
		if(comment.getCommentCommentedId() == -1){
			comment.setCommentedReader(readerMapper.getReader(comment.getCommentCommentedId()));
		}
		comment.setReader(readerMapper.getReader(comment.getCommentReaderId()));
		return comment;
	}

	@Override
	public List<Reader> getReaderAndReportedTimes() {
		return reportCommentMapper.getReaderReportedTimes();
	}

	public Integer getReaderAndReportedTimes(int readerId) {
		return reportCommentMapper.getReaderReportedTimesOfReader(readerId);
	}

	@Override
	public boolean alterStatu(int commentId, boolean statu) {
		return commentMapper.alterStatu(commentId,statu);
	}

	@Override
	public CommentLikeRecord getCommentLikeRecord(int commentId, int readerId) {
		if(commentLikeRecordMapper.isLiked(readerId,commentId) < 1){
			return null;
		}else{
			CommentLikeRecord commentLikeRecord = new CommentLikeRecord();
			commentLikeRecord.setCommentID(commentId);
			commentLikeRecord.setReaderID(readerId);
			return commentLikeRecord;
		}
	}

	@Override
	public boolean removePost(Integer tId) {
		return commentMapper.removeByCommentTid(tId);
	}

	@Override
	public Comment getPost(int tId) {
		Comment comment = commentMapper.getPostByTid(tId);
		comment.setReader(readerMapper.getReader(comment.getCommentReaderId()));
		return comment;
	}


}
