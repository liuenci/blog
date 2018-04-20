package com.blog.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * 
 * @author cier
 *
 */
public class ServletImpl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private String contextPath;
	private ThreadLocal<HttpServletRequest> req = new ThreadLocal<>();
	private ThreadLocal<HttpServletResponse> resp = new ThreadLocal<>();
	private final String PARAM_KEY = "_paramKey_";
	
	@Override
	protected final void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			this.contextPath = request.getContextPath();
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			request.setAttribute("cxt", this.contextPath);
			req.set(request);
			resp.set(response);
			HashMap<String,Object> params = (HashMap<String,Object>) request.getSession().getAttribute(PARAM_KEY);
			if(params != null && !params.isEmpty()) {
				for(Entry<String,Object> e : params.entrySet()) {
					request.setAttribute(e.getKey(), e.getValue());
				}
				request.getSession().removeAttribute(this.PARAM_KEY);
			}
			super.service(request, response);
		} catch(Exception e) {
			throw new ServletException(e);
		}
	}
	@Override
	public void service(ServletRequest arg0, ServletResponse arg1) throws ServletException, IOException {
		super.service(arg0, arg1);
	}
	public final void forward(String viewName) throws ServletException, IOException {
		req.get().getRequestDispatcher("/WEB-INF/"+viewName+".jsp").forward(req.get(), resp.get());
	}
	public final void redirect(String uri) throws IOException {
		resp.get().sendRedirect(this.contextPath + uri);
	}
	public final void redirect(String uri,HashMap<String,Object> params) throws IOException {
		req.get().getSession().setAttribute(this.PARAM_KEY, params);
		this.redirect(uri);
	}
}
