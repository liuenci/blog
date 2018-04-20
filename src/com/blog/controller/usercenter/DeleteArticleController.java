package com.blog.controller.usercenter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blog.controller.ServletImpl;
import com.blog.service.ArticleService;

@WebServlet("/usercenter/delete-article")
public class DeleteArticleController extends ServletImpl {
	private ArticleService articleService = new ArticleService();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 获取文章的编号 id
		int id = Integer.parseInt(req.getParameter("id"));
		int result = articleService.deleteArticleById(id);
		PrintWriter out = resp.getWriter();
		out.print(result);
	}
}
