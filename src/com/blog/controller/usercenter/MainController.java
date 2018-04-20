package com.blog.controller.usercenter;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blog.controller.ServletImpl;
import com.blog.service.UserService;
import com.blog.util.MD5Util;
@WebServlet("/usercenter/main")
public class MainController extends ServletImpl {
	private UserService userService = new UserService();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = (String) req.getSession().getAttribute("name");
		if(name==null) {
			redirect("/portal/login");
			return;
		}
		forward("usercenter/main");
	}
}
