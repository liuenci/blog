package com.blog.controller.portal;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blog.controller.ServletImpl;
@WebServlet("/portal/Filing")
public class ArticleFilingController extends ServletImpl {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		forward("portal/ArticleFiling");
	}
}
