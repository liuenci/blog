package com.blog.controller.portal;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blog.controller.ServletImpl;
import com.blog.pojo.ArticleOutline;
import com.blog.service.ArticleService;
@WebServlet("/myblog")
public class BlogMainController extends ServletImpl {
	private ArticleService articleService = new ArticleService();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<ArticleOutline> artList = articleService.getAllArticle();
		req.setAttribute("artList", artList);
		forward("/portal/myblog");
	}
}
