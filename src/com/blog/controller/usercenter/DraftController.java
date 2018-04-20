package com.blog.controller.usercenter;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blog.controller.ServletImpl;
import com.blog.pojo.Draft;
import com.blog.service.DraftService;
import com.blog.service.UserService;

@WebServlet("/usercenter/draft")
public class DraftController extends ServletImpl {
	private DraftService draftService = new DraftService();
	private UserService userService = new UserService();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getSession().getAttribute("name").toString();
		int uId = userService.searchId(name);
		List<Draft> draftList = draftService.getAllDraftByUserId(uId);
		if(!draftList.isEmpty()) {
			req.setAttribute("draftList", draftList);
		}
		forward("usercenter/draft");
	}
}
