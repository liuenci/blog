package com.blog.controller.usercenter;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blog.controller.ServletImpl;
import com.blog.service.ArticleService;
import com.blog.service.UserService;

@WebServlet("/usercenter/delete-tag")
public class DeleteTagController extends ServletImpl {
	private ArticleService articleService = new ArticleService();
	private UserService userService = new UserService();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 获取标签的id
		int tId = Integer.parseInt(req.getParameter("id"));
		// 获取博主id
		String name = req.getSession().getAttribute("name").toString();
		int uId = userService.searchId(name);
		int result = articleService.deleteTag(uId,tId);
	}

}
