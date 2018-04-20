package com.blog.controller.usercenter;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blog.controller.ServletImpl;
import com.blog.pojo.User;
import com.blog.service.UserService;

@WebServlet("/usercenter/information")
public class InformationController extends ServletImpl {

	private UserService userService = new UserService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 获取博主的id
		String name = req.getSession().getAttribute("name").toString();
		int uId= userService.searchId(name);
		
		
		User user = userService.getUserInfoById(uId);
		req.setAttribute("user", user);
		forward("usercenter/information");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = (String) req.getParameter("umane");
		String phone = (String) req.getParameter("phone");
		String email = (String) req.getParameter("email");
		String explanation = (String) req.getParameter("personal");
		int id = userService.searchId(username);
		userService.updateUserInformation(phone, email, explanation, id);
		redirect("/usercenter/information");
	}
}
