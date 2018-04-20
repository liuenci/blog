package com.blog.controller.portal;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blog.controller.ServletImpl;
import com.blog.service.UserService;
@WebServlet("/check_useremail")
public class CheckUserEmailController extends ServletImpl {
	private UserService userService = new UserService();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		int result = userService.checkUserEmail(email);
		PrintWriter out = resp.getWriter();
		if(result==0) {
			out.print("no");
		}else {
			out.print("yes");
		}
	}
}
