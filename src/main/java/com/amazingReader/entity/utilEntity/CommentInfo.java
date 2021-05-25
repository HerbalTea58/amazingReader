package com.amazingReader.entity.utilEntity;

import com.amazingReader.entity.Comment;
import com.amazingReader.entity.Reader;

public class CommentInfo {
    private Reader reader;
    private Comment comment;
    private Integer likeNum;

    public Reader getReader() {
        return reader;
    }

    public void setReader(Reader reader) {
        this.reader = reader;
    }

    public Comment getComment() {
        return comment;
    }

    public void setComment(Comment comment) {
        this.comment = comment;
    }

    public Integer getLikeNum() {
        return likeNum;
    }

    public void setLikeNum(Integer likeNum) {
        this.likeNum = likeNum;
    }
}
