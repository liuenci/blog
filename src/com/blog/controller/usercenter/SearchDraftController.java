package com.blog.controller.usercenter;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blog.controller.ServletImpl;
import com.blog.pojo.Draft;
import com.blog.service.DraftService;
import com.blog.service.UserService;

import net.sf.json.JSONArray;
@WebServlet("/usercenter/search-draft")
public class SearchDraftController extends ServletImpl {
	private UserService userService = new UserService();
	private DraftService draftService = new DraftService();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getSession().getAttribute("name").toString();
		int id = userService.searchId(name);
		String titleName = req.getParameter("title");
		List<Draft> draft = draftService.searchDraft(id, titleName);
		JSONArray json = JSONArray.fromObject(draft);
		PrintWriter out = resp.getWriter();
		out.print(json);
	}
}
