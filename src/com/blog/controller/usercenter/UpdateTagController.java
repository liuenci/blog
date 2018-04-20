package com.blog.controller.usercenter;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blog.controller.ServletImpl;
import com.blog.service.TagService;
@WebServlet("/usercenter/update-tag")
public class UpdateTagController extends ServletImpl {
	private TagService tagService = new TagService();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 接收前台的参数
		int id = Integer.parseInt(req.getParameter("id"));
		String name = req.getParameter("name");
		tagService.updateTagName(name, id);
		redirect("/usercenter/tag-manage");
	}
}
