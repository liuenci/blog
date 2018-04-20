package com.blog.controller.usercenter;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blog.controller.ServletImpl;
import com.blog.dao.UserDao;
import com.blog.util.MD5Util;
@WebServlet("/usercenter/update-password")
public class UpdatePassword extends ServletImpl {
	private UserDao userDao = new UserDao();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		forward("usercenter/update-password");
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getSession().getAttribute("name").toString();
		int id = userDao.searchId(name);
		String oldPassword = req.getParameter("old-password");
		String newPassword = req.getParameter("new-password");
		String repeatPassword = req.getParameter("repeat-password");
		HashMap<String,Object> ms = new HashMap<>();
		if(oldPassword.trim()==null||oldPassword.trim().equals("")||oldPassword.isEmpty()) {
			ms.put("error", "旧密码不能为空");
			redirect("/usercenter/update-password",ms);
			return;
		}
		if(newPassword.trim()==null||newPassword.trim().equals("")||newPassword.isEmpty()) {
			ms.put("error", "新密码不能为空");
			redirect("/usercenter/update-password",ms);
			return;
		}
		if(repeatPassword.trim()==null||repeatPassword.trim().equals("")||repeatPassword.isEmpty()) {
			ms.put("error", "重复密码不能为空");
			redirect("/usercenter/update-password",ms);
			return;
		}
		if(!newPassword.equals(repeatPassword)) {
			ms.put("error", "两次密码不一致");
			redirect("/usercenter/update-password",ms);
			return;
		}
		int result = userDao.checkUserPassword(name, MD5Util.MD5Encode(oldPassword, "utf-8"));
		if(result!=1) {
			ms.put("error", "旧密码错误");
			redirect("/usercenter/update-password",ms);
			return;
		}
		if(userDao.updatePassword(id, MD5Util.MD5Encode(newPassword, "utf-8"))!=1) {
			ms.put("error", "密码更新失败");
			redirect("/usercenter/update-password",ms);
			return;
		}
		ms.put("error", "密码更新成功");
		redirect("/usercenter/update-password",ms);
	}
}
