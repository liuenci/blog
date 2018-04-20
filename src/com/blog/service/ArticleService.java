package com.blog.service;

import java.util.List;

import com.blog.dao.ArticleDao;
import com.blog.pojo.AllArticle;
import com.blog.pojo.ArticleDetail;
import com.blog.pojo.ArticleOutline;
import com.blog.pojo.ArticleTag;
import com.blog.pojo.BackArticle;
import com.blog.pojo.CateNum;
import com.blog.pojo.Categories;
import com.blog.pojo.Discuss;
import com.blog.pojo.MonthNum;
import com.blog.pojo.User;
import com.blog.pojo.UserMainArticle;

public class ArticleService {
	private ArticleDao articleDao;

	public ArticleService() {
		articleDao = new ArticleDao();
	}
	/**
	 * @param id
	 * @param title
	 * @return
	 */
	public List<AllArticle> searchArticle(int id,String title){
		return articleDao.searchArticle(id, title);
	}
	/**
	 * 获取所有文章的概要
	 * @return
	 */
	public List<ArticleOutline> getAllArticle(){
		return articleDao.getAllArticle();
	}
	/**
	 * 删除评论
	 * 
	 * @param id
	 * @return
	 */
	public int deleteDiscussById(int id) {
		return articleDao.deleteDiscussById(id);
	}

	/**
	 * 通过文章的id删除文章
	 * 
	 * @param id
	 * @return
	 */
	public int deleteArticleById(int id) {
		// 先删除文章
		int result1 = articleDao.deleteArticleById(id);
		return result1;
	}

	/**
	 * 根据ID删除对应行标签
	 * 
	 * @param id
	 * @return
	 */
	public int deleteTag(int uId, int tId) {
		return articleDao.deleteTag(uId, tId);
	}

	/**
	 * 根据用户 name 获取用户 id
	 * 
	 * @param name
	 * @return
	 */
	public int getUserIdByName(String name) {
		return articleDao.getUserIdByName(name);
	}

	/**
	 * 
	 * 博主的所有评论
	 * 
	 * @param uId
	 * @return
	 */
	public List<Discuss> getAllDiscussById(int uId) {
		return articleDao.getAllDiscussById(uId);
	}

	/**
	 * 添加新文章
	 * 
	 * @param title
	 * @param cate_id
	 * @param tag_id
	 * @param content
	 * @param date
	 * @param c_num
	 * @param u_id
	 * @return
	 */
	public int addNewArticle(String title, int cate_id, String[] tag, String content, int u_id) {
		// 添加至文章表
		int result1 = articleDao.addNewArticle(title, cate_id, content, u_id);
		// 找到文章 id
		int aId = articleDao.getArticleIdByTitle(title);
		// 将文章表与标签表建立联系
		int result2 = articleDao.addNewInnerTag(aId, tag);
		return result1 + result2;
	}

	/**
	 * 根据用户id查询所有文章
	 * 
	 * @param id
	 * @return
	 */
	public List<UserMainArticle> getAllArticleByUserId(int id) {
		return articleDao.getAllArticleByUserId(id);
	}

	/**
	 * 根据用户Id 查询所有文章的概述
	 * 
	 * @param id
	 * @return
	 */
	public List<AllArticle> getAllArticleOverview(int id) {
		return articleDao.getAllArticleOverview(id);
	}

	/**
	 * 得到用户所有信息
	 * 
	 * @return
	 */
	public List<User> getAllMaterial() {
		return articleDao.getAllMaterial();
	}

	/**
	 * 得到所有文章
	 * 
	 * @return
	 */
	public List<BackArticle> getBackArticle() {
		return articleDao.getBackArticle();
	}

	/**
	 * 得到所有分类
	 * 
	 * @return
	 */
	public List<Categories> getCategories() {
		return articleDao.getCategories();
	}

	/**
	 * 计算博主所有文章数目
	 * 
	 * @param id
	 * @return
	 */
	public int getArticleNumber(int id) {
		return articleDao.getArticleNumber(id);
	}

	/**
	 * 计算博主所有文章的所有评论
	 * 
	 * @param id
	 * @return
	 */
	public int getAllDiscussNumber(int id) {
		return articleDao.getAllDiscussNumber(id);
	}

	/**
	 * 获取某个博主所有文章的分类以及文章篇数
	 * 
	 * @param id
	 * @return
	 */
	public List<CateNum> getAllCate(int id) {
		return articleDao.getAllCate(id);
	}

	/**
	 * 按月查询文章的篇数
	 * 
	 * @param id
	 * @return
	 */
	public List<MonthNum> getMonthAndNum(int id) {
		return articleDao.getMonthAndNum(id);
	}

	/**
	 * 
	 * @param id
	 * @return
	 */
	public ArticleDetail getArticleDetailById(int id) {
		return articleDao.getArticleDetailById(id);
	}

	/**
	 * 根据文章 id 查询这篇文章的所有标签
	 * 
	 * @param aId
	 * @return
	 */
	public List<ArticleTag> getArticleTagById(int aId) {
		return articleDao.getArticleTagById(aId);
	}
	/**
	 * 更新阅读数
	 * @param id
	 * @return
	 */
	public int updateReadNum(int id) {
		return articleDao.updateReadNum(id);
	}
}
