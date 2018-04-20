package com.blog.controller.usercenter;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blog.controller.ServletImpl;
import com.blog.pojo.Categories;
import com.blog.pojo.Tag;
import com.blog.service.ArticleService;
import com.blog.service.CateService;
import com.blog.service.TagService;
import com.blog.service.UserService;

@WebServlet("/usercenter/edit")
public class EditController extends ServletImpl {
	private ArticleService articleService = new ArticleService();
	private UserService userService = new UserService();
	private TagService tagService = new TagService();
	private CateService cateService = new CateService();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 获取所有分类
		List<Categories> cateList = cateService.getAllCategories();
		req.setAttribute("cate", cateList);

		// 获取用户标签
		String name = (String) req.getSession().getAttribute("name");
		int id = articleService.getUserIdByName(name);
		List<Tag> tagList = tagService.getAllOriginTag(id);
		req.setAttribute("tag", tagList);
		forward("usercenter/edit");
	}
}
