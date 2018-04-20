package com.blog.controller.usercenter;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.junit.Test;

import com.blog.controller.ServletImpl;
import com.blog.pojo.Tag;
import com.blog.service.ArticleService;
import com.blog.service.TagService;
import com.blog.service.UserService;

@WebServlet("/usercenter/tag-manage")
public class TagController extends ServletImpl {

	private UserService userService = new UserService();
	private TagService tagService = new TagService();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = (String) req.getSession().getAttribute("name");
		int uId = userService.searchId(name);
		List<Tag> allTag = tagService.getAllTag(uId);
		req.setAttribute("allTag", allTag);
		forward("usercenter/tag");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String label = req.getParameter("label");
		String name = (String) req.getSession().getAttribute("name");
		int id = userService.searchId(name);
		tagService.addNewTag(label,id);
		redirect("/usercenter/tag-manage");
	}
}
