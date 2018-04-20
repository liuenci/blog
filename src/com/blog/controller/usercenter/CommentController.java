package com.blog.controller.usercenter;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blog.controller.ServletImpl;
import com.blog.pojo.Discuss;
import com.blog.service.ArticleService;
import com.blog.service.UserService;

@WebServlet("/usercenter/comment")
public class CommentController extends ServletImpl {
	private ArticleService articleService = new ArticleService();
	private UserService userService = new UserService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = (String) req.getSession().getAttribute("name");
		int uId = userService.searchId(name);
		List<Discuss> dis = articleService.getAllDiscussById(uId);
		req.setAttribute("discuss", dis);
		int disnum = articleService.getAllDiscussNumber(uId);
		req.setAttribute("disnum", disnum);
		forward("usercenter/comment");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		int result = articleService.deleteDiscussById(id);
		PrintWriter out = resp.getWriter();
		out.print(id);
	}
}
