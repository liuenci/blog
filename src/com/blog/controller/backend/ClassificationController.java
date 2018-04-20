package com.blog.controller.backend;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blog.controller.ServletImpl;
import com.blog.pojo.Categories;
import com.blog.service.ArticleService;
import com.blog.service.CateService;

@WebServlet("/backend/classification")
public class ClassificationController extends ServletImpl {

	private ArticleService articleService = new ArticleService();
	private CateService cateService = new CateService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		List<Categories> cate = articleService.getCategories();
		req.setAttribute("cate", cate);
		forward("backend/classification");
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String catename = req.getParameter("catename");
		cateService.addCategories(catename);
		redirect("/backend/classification");
	}
}
