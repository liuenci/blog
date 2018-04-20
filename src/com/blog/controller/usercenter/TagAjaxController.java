package com.blog.controller.usercenter;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blog.controller.ServletImpl;
import com.blog.service.DraftService;

@WebServlet("/usercenter/get-tagid")
public class TagAjaxController extends ServletImpl {
	private DraftService draftService = new DraftService();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id").trim());
		// 获取用户选中的标签
		List<String> tagIdList = draftService.getChooseTag(id);
		StringBuffer str = new StringBuffer();
		if(!tagIdList.isEmpty()) {
			for(int i = 0;i<tagIdList.size();i++) {
				str.append(tagIdList.get(i));
				if (i!=tagIdList.size()-1) {
					str.append("/");
				}
			}
		}
		
		PrintWriter out = resp.getWriter();
		out.print(str.toString());
	}
}
