package com.blog.service;

import java.util.List;

import com.blog.dao.TagDao;
import com.blog.pojo.Tag;

public class TagService {
	private TagDao tagDao;

	public TagService() {
		tagDao = new TagDao();
	}

	/**
	 * 通过博主Id获取已经创建的原始标签
	 * 
	 * @param uId
	 * @return
	 */
	public List<Tag> getAllOriginTag(int uId) {
		return tagDao.getAllOriginTag(uId);
	}

	/**
	 * 标签库的所有标签
	 * 
	 * @param uId
	 * @return
	 */
	public List<Tag> getAllTag(int uId) {
		return tagDao.getAllTag(uId);
	}

	/**
	 * 添加新标签
	 * 
	 * @param tagName
	 * @param uId
	 * @return
	 */
	public int addNewTag(String tagName, int uId) {
		// 首先添加到标签库
		int result1 = tagDao.addTag(tagName);
		// 获取最新的标签id
		int tagId = tagDao.getMostNewTagId();
		// 建立用户与标签的关系
		int result2 = tagDao.addInnerTag(uId, tagId);
		return result1 + result2;
	}
	/**
	 * 更新标签名称
	 * @param name
	 * @param id
	 * @return
	 */
	public int updateTagName(String name, int id) {
		return tagDao.updateTagName(name, id);
	}
}
