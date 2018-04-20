package com.blog.service;

import java.util.List;

import com.blog.dao.CommentDao;
import com.blog.pojo.Comment;

public class CommentService {
	private CommentDao commentDao;

	public CommentService() {
		commentDao = new CommentDao();
	}

	/**
	 * 游客评论
	 * 
	 * @param content
	 * @param aId
	 * @param uId
	 * @return
	 */
	public int addNewCommentByVisitor(String content, int aId) {
		return commentDao.addNewCommentByVisitor(content, aId);
	}
	/**
	 * 博主评论
	 * @param content
	 * @param aId
	 * @param uId
	 * @return
	 */
	public int addNewComment(String content, int aId, int uId) {
		return commentDao.addNewCommentBy(content, aId, uId);
	}
	/**
	 * 获取一篇文章的所有评论
	 * @param id
	 * @return
	 */
	public List<Comment> getAllCommentByArticleId(int id){
		return commentDao.getAllCommentByArticleId(id);
	}
}
