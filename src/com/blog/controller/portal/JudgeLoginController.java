package com.blog.controller.portal;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blog.controller.ServletImpl;
@WebServlet("/judge-login")
public class JudgeLoginController extends ServletImpl {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Object name = req.getSession().getAttribute("name");
		PrintWriter out = resp.getWriter();
		if(name==null) {
			out.print("no");
			return;
		}
		out.print("yes");
	}
}
