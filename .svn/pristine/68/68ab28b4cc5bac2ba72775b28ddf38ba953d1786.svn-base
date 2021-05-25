package com.amazingReader.mapper;

import com.amazingReader.entity.CommentLikeRecord;

public interface CommentLikeRecordMapper {
    public boolean addCommentLike(CommentLikeRecord record);

    public boolean removeCommentLike(CommentLikeRecord record);

	/**
	 * 返回0则没有点赞过该条
	 * 
	 * @param readerId
	 * @param commentId
	 * @return
	 */
	public int isLiked(int readerId, int commentId);

	int getLikeNumOfComment(int commentId);
}
