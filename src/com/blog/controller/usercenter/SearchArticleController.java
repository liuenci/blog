package com.blog.controller.usercenter;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blog.controller.ServletImpl;
import com.blog.pojo.AllArticle;
import com.blog.service.ArticleService;
import com.blog.service.UserService;

import net.sf.json.JSONArray;
@WebServlet("/usercenter/search-article")
public class SearchArticleController extends ServletImpl {
	private UserService userService = new UserService();
	private ArticleService articleService = new ArticleService();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getSession().getAttribute("name").toString();
		int id = userService.searchId(name);
		String titleName = req.getParameter("title");
		List<AllArticle> article = articleService.searchArticle(id, titleName);
		JSONArray json = JSONArray.fromObject(article);
		PrintWriter out = resp.getWriter();
		out.print(json);
	}
}
