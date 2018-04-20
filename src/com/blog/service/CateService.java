package com.blog.service;

import java.util.List;

import com.blog.dao.CateDao;
import com.blog.pojo.Categories;

public class CateService {
	private CateDao cateDao;

	public CateService() {
		cateDao = new CateDao();
	}

	/**
	 * 获取所有分类
	 * 
	 * @return
	 */
	public List<Categories> getAllCategories() {
		return cateDao.getAllCategories();
	}

	/**
	 * 添加新标签
	 * 
	 * @return
	 */
	public int addCategories(String catename) {
		return cateDao.addCategories(catename);
	}
}
