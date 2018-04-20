package com.blog.controller.backend;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blog.controller.ServletImpl;
import com.blog.dao.UserDao;
import com.blog.util.MD5Util;

@WebServlet("/backend/login")
public class LoginController extends ServletImpl {
	private UserDao userDao = new UserDao();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getSession().invalidate();;
		forward("backend/login");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("username");
		String password = req.getParameter("password");
		int result = userDao.isManager(name, MD5Util.MD5Encode(password, "utf-8"));
		if(result > 0) {
			req.getSession().setAttribute("name", name);
			redirect("/backend/main");
			return;
		}
		redirect("/backend/login");
	}
}
