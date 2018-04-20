package com.blog.controller.backend;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blog.controller.ServletImpl;
import com.blog.pojo.BackArticle;
import com.blog.service.ArticleService;

@WebServlet("/backend/backarticle")
public class BackArticleController extends ServletImpl {
	private ArticleService articleService = new ArticleService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		List<BackArticle> backArticle = articleService.getBackArticle();
		req.setAttribute("backArticle", backArticle);
		forward("backend/backarticle");
	}
}
