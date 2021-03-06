package com.amazingReader.service.Interface;

import java.util.List;

import com.amazingReader.entity.*;

public interface CommentService {
	/**
	 * 章节下发帖
	 * comment的commented——reader_ID字段留空
	 * @param post
	 * @return
	 */
	boolean post(Comment post);
	/**
	 * 帖子下评论
	 * comment的tId字段为当前帖子Id
	 * @param comment
	 * @return
	 */
	boolean comment(Comment comment);
	/**
	 * 开关方式控制点赞
	 * 用boolean值返回是否点了赞
	 * @param commentId
	 */
	boolean like(int commentId, int readerId);

	boolean removeComment(int commentId);

	List<Comment> getAllPostOf(int chapterId);

	List<Comment> getAllPostOf(int bookId, int chapterNum);
	/**
	 * 通过帖子号获得其下的评论
	 * @param tId
	 * @return
	 */
	List<Comment> getAllCommentsOfPost(int tId);

	/**
	 * 拿的同时修改状态为已阅
	 * @param managerId
	 * @return
	 */
	List<ReportComment> getAllReportComment(int managerId);
	/**
	 * 拿的同时修改状态为已阅
	 * @param managerId
	 * @return
	 */
	List<ReportComment> getToDealReportComment(int managerId);

	Comment getCommentById(int commentId);

	/**
	 * 获得所有用户的被举报次数，降序排列
	 * @return
	 */
	List<Reader> getReaderAndReportedTimes();

	CommentLikeRecord getCommentLikeRecord(int commentId, int readerId);

    boolean removePost(Integer tId);

	Comment getPost(int tId);

	Integer getReaderAndReportedTimes(int readerId);
	public boolean alterStatu(int commentId, boolean statu);
}
