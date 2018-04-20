package com.blog.controller.usercenter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blog.controller.ServletImpl;
import com.blog.service.DraftService;

@WebServlet("/usercenter/delete-draft")
public class DeleteDraftController extends ServletImpl {
	private DraftService draftService = new DraftService();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 获取要删除的草稿 id
		int id = Integer.parseInt(req.getParameter("id"));
		int result = draftService.deleteDraft(id);
		PrintWriter out = resp.getWriter();
		out.print(result);
	}
}
