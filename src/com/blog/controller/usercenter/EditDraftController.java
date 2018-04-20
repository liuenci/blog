package com.blog.controller.usercenter;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blog.controller.ServletImpl;
import com.blog.pojo.Categories;
import com.blog.pojo.DraftDetail;
import com.blog.pojo.Tag;
import com.blog.service.ArticleService;
import com.blog.service.CateService;
import com.blog.service.DraftService;
import com.blog.service.TagService;
import com.blog.service.UserService;

@WebServlet("/usercenter/edit-draft")
public class EditDraftController extends ServletImpl {
	private DraftService draftService = new DraftService();
	private UserService userService = new UserService();
	private TagService tagService = new TagService();
	private CateService cateService = new CateService();
	private ArticleService articleService = new ArticleService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		DraftDetail draft = draftService.getDraftDetailById(id);
		req.setAttribute("draft", draft);

		// 获取所有分类
		List<Categories> cateList = cateService.getAllCategories();
		req.setAttribute("cate", cateList);

		// 获取用户标签
		String name = (String) req.getSession().getAttribute("name");
		int uid = articleService.getUserIdByName(name);
		List<Tag> tagList = tagService.getAllOriginTag(uid);
		req.setAttribute("tag", tagList);
		forward("usercenter/edit-draft");
	}
}
