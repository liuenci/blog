package com.blog.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.blog.dao.conn.DataManager;
import com.blog.dao.conn.ParamSet;
import com.blog.dao.conn.ParamSetimpl;
import com.blog.dao.conn.RowDatas;
import com.blog.pojo.Categories;
import com.sun.rowset.internal.Row;

public class CateDao extends DataManager {
	private RowDatas<Categories> cate;
	private RowDatas<Integer> inte;
	private RowDatas<String> str;

	public CateDao() {
		cate = new CateRows();
		inte = new IntegerDatas();
		str = new StringDatas();
	}

	/**
	 * 获取所有分类
	 * 
	 * @return
	 */
	public List<Categories> getAllCategories() {
		String sql = "select id,name from categories";
		return queryList(sql, cate);
	}

	/**
	 * 添加新标签
	 * 
	 * @return
	 */
	public int addCategories(String catename) {
		String sql = "INSERT INTO categories (name) VALUES (?)";
		return updateExecuted(sql, new ParamSet(catename));
	}

	private class CateRows implements RowDatas<Categories> {

		@Override
		public Categories getRowData(ResultSet rs) throws SQLException {
			Categories cate = new Categories();
			cate.setId(rs.getInt(1));
			cate.setName(rs.getString(2));
			return cate;
		}
	}

	private class IntegerDatas implements RowDatas<Integer> {
		@Override
		public Integer getRowData(ResultSet rs) throws SQLException {

			return rs.getInt(1);
		}
	}

	private class StringDatas implements RowDatas<String> {
		@Override
		public String getRowData(ResultSet rs) throws SQLException {

			return rs.getString(1);
		}
	}
}
