package com.blog.controller.backend;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blog.controller.ServletImpl;
import com.blog.pojo.User;
import com.blog.service.ArticleService;

@WebServlet("/backend/user")
public class UserController extends ServletImpl {

	private ArticleService aricleService = new ArticleService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		List<User> user = aricleService.getAllMaterial();
		req.setAttribute("user", user);		
		forward("backend/user");
	}
}
