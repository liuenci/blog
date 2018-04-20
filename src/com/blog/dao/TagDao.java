package com.blog.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.blog.dao.conn.DataManager;
import com.blog.dao.conn.ParamSet;
import com.blog.dao.conn.RowDatas;
import com.blog.pojo.Tag;

public class TagDao extends DataManager {
	private RowDatas<Tag> originTag;
	private RowDatas<Tag> userTag;
	private RowDatas<Integer> inte;

	public TagDao() {
		originTag = new OriginTagDatas();
		userTag = new TagRows();
		inte = new InteDatas();
	}
	/**
	 * 删除文章关联的标签id
	 * @param id
	 * @return
	 */
	public int deleteTagInner(int id) {
		String sql = "delete from article_tag_inner where a_id = ?";
		return updateExecuted(sql,new ParamSet(id));
	}
	/**
	 * 通过博主Id获取已经创建的原始标签
	 * 
	 * @param uId
	 * @return
	 */
	public List<Tag> getAllOriginTag(int uId) {
		String sql = "select tag.id ,tag.name from user\r\n"
				+ "left join user_tag_inner on `user`.id = user_tag_inner.u_id\r\n"
				+ "left join tag on user_tag_inner.t_id = tag.id\r\n" + "where user.id = ?";
		return queryList(sql, new ParamSet(uId), originTag);
	}

	/**
	 * 添加新标签
	 * 
	 * @param name
	 * @param id
	 * @return
	 */
	public int addTag(String name) {
		String sql = "insert into tag (name) values (?)";
		return updateExecuted(sql, new ParamSet(name));
	}

	/**
	 * 添加标签表和用户表之间的关系
	 * 
	 * @param tId
	 * @param uId
	 * @return
	 */
	public int addInnerTag(int uId, int tId) {
		String sql = "insert into user_tag_inner(u_id,t_id) value (?,?)";
		return updateExecuted(sql, new ParamSet(uId, tId));
	}

	/**
	 * 提交事务
	 * 
	 * @return
	 */
	public int commit() {
		String sql = "commit";
		return updateExecuted(sql);
	}

	/**
	 * 查询用户的所有标签
	 * 
	 * @param uId
	 * @return
	 */
	public List<Tag> getAllTag(int uId) {
		String sql = "select DISTINCT(tag.id),tag.name from user_tag_inner "
				+ " left join tag on user_tag_inner.t_id = tag.id " + " where user_tag_inner.u_id = ? ";
		return queryList(sql, new ParamSet(uId), userTag);
	}

	/**
	 * 获取最新的标签 id
	 * 
	 * @return
	 */
	public int getMostNewTagId() {
		String sql = "select id from tag ORDER BY id desc limit 1";
		return query(sql, inte);
	}
	/**
	 * 更新标签名
	 * @param name
	 * @param id
	 * @return
	 */
	public int updateTagName(String name ,int id) {
		String sql = "update tag set name = ? where id = ?";
		return updateExecuted(sql, new ParamSet(name,id));
	}

	/**
	 * 博主标签库中的所有标签数据集
	 * 
	 * @author cier
	 */
	private class TagRows implements RowDatas<Tag> {

		@Override
		public Tag getRowData(ResultSet rs) throws SQLException {
			Tag tag = new Tag();
			tag.setId(rs.getInt(1));
			tag.setName(rs.getString(2));
			return tag;
		}
	}

	/**
	 * 原始标签显示
	 * 
	 * @author cier
	 *
	 */
	private class OriginTagDatas implements RowDatas<Tag> {

		@Override
		public Tag getRowData(ResultSet rs) throws SQLException {
			Tag tag = new Tag();
			tag.setId(rs.getInt(1));
			tag.setName(rs.getString(2));
			return tag;
		}
	}

	/**
	 * 获取一个整形
	 * 
	 * @author cier
	 */
	private class InteDatas implements RowDatas<Integer> {
		@Override
		public Integer getRowData(ResultSet rs) throws SQLException {
			return rs.getInt(1);
		}
	}
}
