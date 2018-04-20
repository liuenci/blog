package com.blog.controller.portal;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blog.controller.ServletImpl;
import com.blog.pojo.CateNum;
import com.blog.pojo.MonthNum;
import com.blog.pojo.UserMainArticle;
import com.blog.service.ArticleService;
import com.blog.service.UserService;
@WebServlet("/user/main")
public class UserMainPagesController extends ServletImpl {
	private ArticleService articleService = new ArticleService();
	private UserService userService = new UserService();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getSession().getAttribute("name").toString();
		int id = userService.searchId(name);
		// 获取用户 name
		req.setAttribute("name", name);
		req.setAttribute("description", "台灯是夜猫子的眼睛，熬夜是程序猿的倔强");
		// 获取用户 id
		
		// 获取所有文章
		List<UserMainArticle> artiList = articleService.getAllArticleByUserId(id);
		req.setAttribute("art", artiList);
		
		// 获取所有分类
		List<CateNum> cateNumList = articleService.getAllCate(id);
		req.setAttribute("cateNumList", cateNumList);
		
		// 获取每月文章篇数
		List<MonthNum> monthNumList = articleService.getMonthAndNum(id);
		req.setAttribute("monthNumList", monthNumList);
		//
		forward("portal/user-main");
	}
}
