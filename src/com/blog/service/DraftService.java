package com.blog.service;

import java.util.List;

import com.blog.dao.DraftDao;
import com.blog.dao.TagDao;
import com.blog.pojo.Draft;
import com.blog.pojo.DraftDetail;

public class DraftService {
	private DraftDao draftDao;
	private TagDao tagDao;

	public DraftService() {
		draftDao = new DraftDao();
		tagDao = new TagDao();
	}
	/**
	 * 通过草稿名找草稿
	 * @param id
	 * @param title
	 * @return
	 */
	public List<Draft> searchDraft(int id,String title){
		return draftDao.searchDraft(id, title);
	}
	/**
	 * 查询所有草稿
	 * 
	 * @param uId
	 * @return
	 */
	public List<Draft> getAllDraftByUserId(int uId) {
		return draftDao.getAllDraftByUserId(uId);
	}

	/**
	 * 从草稿箱中发布文章
	 * 
	 * @param id
	 * @return
	 */
	public int releaseArticle(int id) {
		return draftDao.releaseArticle(id);
	}

	/**
	 * 从草稿箱中删除文章
	 * 
	 * @param id
	 * @return
	 */
	public int deleteDraft(int id) {
		return draftDao.deleteDraft(id);
	}

	/**
	 * 添加新的草稿
	 * 
	 * @param title
	 * @param cate_id
	 * @param tag
	 * @param content
	 * @param u_id
	 * @return
	 */
	public int addNewDraft(String title, int cate_id, String[] tag, String content, int u_id) {
		int result1 = draftDao.addNewDraft(title, cate_id, content, u_id);
		int id = draftDao.getDraftIdByTitle(title);
		int result2 = draftDao.addNewInnerTag(id, tag);
		return result1 + result2;
	}
	/**
	 * 查询某篇文章
	 * @param id
	 * @return
	 */
	public DraftDetail getDraftDetailById(int id) {
		return draftDao.getDraftById(id);
	}
	/**
	 * 获取选中的标签
	 * @param id
	 * @return
	 */
	public List<String> getChooseTag(int id){
		return draftDao.getChooseTag(id);
	}
	/**
	 * 更新草稿
	 * @param id
	 * @param title
	 * @param content
	 * @param cateId
	 * @param tId
	 * @return
	 */
	public int updateDraftById(int id,String title,String content,int cateId,String[] tId) {
		int result1 = draftDao.updateDraftById(id, title, content, cateId);
		// 删除原先关联的标签
		int result2 = tagDao.deleteTagInner(id);
		// 添加新标签
		int result3 = draftDao.addNewInnerTag(id, tId);
		return result1 + result2 + result3;
	}
}
