package com.amazingReader.mapper;

import java.util.List;

import com.amazingReader.entity.Comment;

public interface CommentMapper {
	public int getMaxTID();
	
	public boolean add(Comment comment);
	public boolean alter(Comment comment);
	public boolean removeByCommentTid(int commentTid);
	public boolean removeByCommentId(int commentId);

	public Comment getCommentBy(int commentId);
	/**
	 * 获得章节下评论
	 * @param chapterId
	 * @return
	 */

	public List<Comment> getTieZiByChapterId(int chapterId);
	/**
	 * 获得评论下回复
	 * @param tId
	 * @return
	 */
	public List<Comment> getCommentsByTieZiId(int tId);
	/**
	 * 获得某用户发出的所有评论
	 * @param readerId
	 * @return
	 */
	public List<Comment> getCommentsByReaderId(int readerId);

	/**
	 * 返回阅读者的未阅读的评论条数
	 * @param readerId
	 * @return
	 */
	int getCommentsNumToReaderId(int readerId);
	/**
	 * 获得发给某用户的所有评论
	 * @param readerId
	 * @return
	 */
	public List<Comment> getCommentsToReaderId(int readerId);

	public boolean alterStatu(int commentId, boolean statu);

	List<Comment> getAllPostSendBy(int readerId);


    Comment getPostByTid(int tId);

    Comment getWidelyCommentBy(Integer commentId);

	void downShelfCommentById(int commentId);
}
