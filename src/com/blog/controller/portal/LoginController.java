package com.blog.controller.portal;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blog.controller.ServletImpl;
import com.blog.service.UserService;
import com.blog.util.MD5Util;

@WebServlet("/portal/login")
public class LoginController extends ServletImpl {
	private UserService userService = new UserService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 清除当前会话
		req.getSession().invalidate();
		forward("portal/login");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 获取前台传进来的参数
		String name = req.getParameter("username");
		String password = req.getParameter("password");
		
		// 检查是否存在该用户名
		int count = userService.checkUserName(name);
		if(count==0) {
			req.setAttribute("error", "用户不存在");
			forward("usercenter/error");
			return;
		}
		
		// 检查用户密码是否正确
		int result = userService.checkUserPassword(name, MD5Util.MD5Encode(password, "utf-8"));
		if(result == 0) {
			req.setAttribute("error","密码不正确");
			forward("portal/login");
			return;
		}
		req.setAttribute("success", name);
		req.getSession().setAttribute("name", name);
		req.getSession().setMaxInactiveInterval(100000000);
		HashMap map = new HashMap<>();
		map.put(name, name);
		redirect("/usercenter/main",map);
	}
}
