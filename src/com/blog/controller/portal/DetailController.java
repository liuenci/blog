package com.blog.controller.portal;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blog.controller.ServletImpl;
import com.blog.pojo.ArticleDetail;
import com.blog.pojo.ArticleTag;
import com.blog.pojo.Comment;
import com.blog.service.ArticleService;
import com.blog.service.CommentService;

@WebServlet("/portal/article/detail")
public class DetailController extends ServletImpl {
	private ArticleService articleService = new ArticleService();
	private CommentService commentService = new CommentService();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 获取文章主键 id
		int id = Integer.parseInt(req.getParameter("id"));
		// 更新阅读数
		int result = articleService.updateReadNum(id);  
		ArticleDetail detail = articleService.getArticleDetailById(id);
		req.setAttribute("detail", detail);
		
		// 获取该篇文章的所有标签
		List<ArticleTag> tagList = articleService.getArticleTagById(id);
		req.setAttribute("tagList", tagList);
		
		// 获得该篇文章的所有评论
		List<Comment> comList = commentService.getAllCommentByArticleId(id);
		req.setAttribute("comment", comList);
		forward("portal/detail");
	}
}
