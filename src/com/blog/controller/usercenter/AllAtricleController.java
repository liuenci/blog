package com.blog.controller.usercenter;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blog.controller.ServletImpl;
import com.blog.pojo.AllArticle;
import com.blog.service.ArticleService;
import com.blog.service.UserService;

@WebServlet("/usercenter/all-article")
public class AllAtricleController extends ServletImpl {

	private ArticleService atricleService = new ArticleService();
	private UserService userService = new UserService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = (String) req.getSession().getAttribute("name");
		int uId = userService.searchId(name);
		List<AllArticle> allarticle = atricleService.getAllArticleOverview(uId);
		req.setAttribute("allarticle", allarticle);
		int artnum = atricleService.getArticleNumber(uId);
		req.setAttribute("artnum", artnum);
		forward("usercenter/all-article");
	}
}
