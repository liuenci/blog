package com.blog.controller.portal;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blog.controller.ServletImpl;
import com.blog.service.UserService;
import com.blog.util.MD5Util;

@WebServlet("/portal/register")
public class RegistController extends ServletImpl {
	private UserService userService = new UserService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		forward("portal/register");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 接受参数
		String name = req.getParameter("username");
		String password = req.getParameter("password");
		String confirm_password = req.getParameter("confirm_password");
		String phone = req.getParameter("phone_number");
		String email = req.getParameter("email");
		// 检查用户名合法性
		if (name.equals("") || name == null) {
			req.setAttribute("error", "用户名不能为空");
			forward("portal/register");
			return;
		}
		int nameResult = userService.checkUserName(name);
		if (nameResult != 0) {
			req.setAttribute("error", "用户名已存在");
			forward("portal/register");
			return;
		}
		// 检查前后两次密码是否一致并且是否为空
		if (password.equals("") || password == null || confirm_password.equals("") || confirm_password == null) {
			req.setAttribute("error", "密码不能为空");
			forward("portal/register");
			return;
		}
		if (!password.equals(password)) {
			req.setAttribute("error", "前后两次密码不一致");
			forward("portal/register");
			return;
		}
		// 检查手机号合法性
		if (phone.equals("") || phone == null) {
			req.setAttribute("error", "手机号不能为空");
			forward("portal/register");
			return;
		}
		int phoneResult = userService.checkUserPhone(phone);
		if (phoneResult != 0) {
			req.setAttribute("error", "手机号已注册");
			forward("portal/register");
			return;
		}
		// 检查邮箱合法性
		if (name.equals("") || name == null) {
			req.setAttribute("error", "邮箱不能为空");
			forward("portal/register");
			return;
		}
		int emailResult = userService.checkUserEmail(email);
		if (emailResult != 0) {
			req.setAttribute("error", "邮箱号已注册");
			forward("portal/register");
			return;
		}
		// 添加用户
		userService.insertUser(name, MD5Util.MD5Encode(password, "utf-8"), phone, email);
		redirect("/portal/login");
	}
}
