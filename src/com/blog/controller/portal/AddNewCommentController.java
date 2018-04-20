package com.blog.controller.portal;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blog.controller.ServletImpl;
import com.blog.service.ArticleService;
import com.blog.service.CommentService;
import com.blog.service.UserService;

@WebServlet("/portal/add-new-comment")
public class AddNewCommentController extends ServletImpl {
	private UserService userService = new UserService();
	private CommentService commentService = new CommentService();
	private ArticleService articleService = new ArticleService();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int aId = Integer.parseInt(req.getParameter("aId"));
		String content = req.getParameter("content");
		int result;
		if (req.getSession().getAttribute("name") == null) {
			result = commentService.addNewCommentByVisitor(content, aId);
		} else {
			String name = req.getSession().getAttribute("name").toString();
			int uId = userService.searchId(name);
			result = commentService.addNewComment(content, aId, uId);
		}
		PrintWriter out = resp.getWriter();
		out.print(result);
	}
}
