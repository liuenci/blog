package com.blog.controller.usercenter;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blog.controller.ServletImpl;

@WebServlet("/usercenter/header")
public class HeaderController extends ServletImpl {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getSession().getAttribute("name").toString();
		req.setAttribute("username", name);
		forward("usercenter/header");
	}
}
