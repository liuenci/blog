package com.blog.controller.backend;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blog.controller.ServletImpl;
@WebServlet("/backend/main")
public class MainController extends ServletImpl {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getSession().getAttribute("name")==null) {
			redirect("/backend/login");
			return;
		}
		forward("backend/main");
	}
}
