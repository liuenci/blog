package com.blog.controller.usercenter;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blog.controller.ServletImpl;
import com.blog.service.DraftService;
import com.blog.service.UserService;

@WebServlet("/usercenter/save-draft")
public class SaveDraftController extends ServletImpl {
	private UserService userService = new UserService();
	private DraftService draftService = new DraftService();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 获取前台传递的值
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		int cateId = Integer.parseInt(req.getParameter("a_type"));
		String[] tagList = req.getParameterValues("tag_type");

		// 获取博主 id
		String name = (String) req.getSession().getAttribute("name");
		int id = userService.searchId(name);
		// 添加草稿
		draftService.addNewDraft(title, cateId, tagList, content, id);
		redirect("/usercenter/draft");
	}
}
