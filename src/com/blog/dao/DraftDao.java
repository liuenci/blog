package com.blog.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.blog.dao.conn.DataManager;
import com.blog.dao.conn.ParamSet;
import com.blog.dao.conn.RowDatas;
import com.blog.pojo.Draft;
import com.blog.pojo.DraftDetail;
import com.blog.util.DateUtil;

public class DraftDao extends DataManager {
	private RowDatas<Draft> draft;
	private RowDatas<Integer> inte;
	private RowDatas<DraftDetail> draftDetail;
	private RowDatas<String> str;

	public DraftDao() {
		draft = new DraftDatas();
		inte = new InteDatas();
		draftDetail = new DraftDetailDatas();
		str = new StringDatas();
	}
	/**
	 * 通过草稿名找草稿
	 * @param title
	 * @return
	 */
	public List<Draft> searchDraft(int id,String title){
		String sql = "select article.id,`user`.`name`,title,categories.name,date,c_num from `user`\r\n" + 
				"LEFT JOIN article on `user`.id = article.u_id\r\n" + 
				"left join categories on categories.id = cate_id where `user`.id = ? and article.status = 2 and concat(title,categories.name,date) like ? ";
				return queryList(sql,new ParamSet(id,"%"+title+"%"),draft);
	}
	/**
	 * 获取博主所有的草稿
	 * 
	 * @param uId
	 * @return
	 */
	public List<Draft> getAllDraftByUserId(int uId) {
		String sql = "select article.id,`user`.`name`,title,categories.name,date,c_num from `user`\r\n" + 
				"LEFT JOIN article on `user`.id = article.u_id\r\n" + 
				"left join categories on categories.id = cate_id where `user`.id = ? and article.status = 2";
		return queryList(sql, new ParamSet(uId), draft);
	}

	/**
	 * 从草稿箱中发布文章
	 * 
	 * @param id
	 * @return
	 */
	public int releaseArticle(int id) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String d = sdf.format(date);
		String sql = "update article set status = ? where id = ?";
		return updateExecuted(sql, new ParamSet(1,id));
	}

	/**
	 * 从草稿箱中删除一篇文章
	 * 
	 * @param id
	 * @return
	 */
	public int deleteDraft(int id) {
		String sql = "update article set status = 0 where id = ?";
		return updateExecuted(sql, new ParamSet(id));
	}
	/**
	 * 删除草稿中的标签
	 * @param id
	 * @return
	 */
	public int deleteDraftTag(int id) {
		String sql = "delete from article_tag_inner where a_id = ?";
		return updateExecuted(sql,new ParamSet(id));
	}
	/**
	 * 更新草稿
	 * @param id
	 * @param title
	 * @param content
	 * @param cateId
	 * @return
	 */
	public int updateDraftById(int id,String title,String content,int cateId) {
		String sql = "update article set title = ?,content = ?,cate_id = ? ,date = ? where id = ?";
		return updateExecuted(sql,new ParamSet(title,content,cateId,DateUtil.NowDate(new Date()),id));
	}

	/**
	 * 添加一篇草稿
	 * 
	 * @param title
	 * @param cate_id
	 * @param content
	 * @param u_id
	 * @return
	 */
	public int addNewDraft(String title, int cate_id, String content, int u_id) {
		// 获取当前时间
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(new java.util.Date());
		String sql = "insert into article(title,cate_id,content,date,c_num,u_id,status)value(?,?,?,?,0,?,2)";
		return updateExecuted(sql, new ParamSet(title, cate_id, content, date, u_id));
	}

	/**
	 * 通过文章标题找到文章的id
	 * 
	 * @param title
	 * @return
	 */
	public int getDraftIdByTitle(String title) {
		String sql = "select id from article where title = ?";
		return query(sql, new ParamSet(title), inte);
	}

	/**
	 * 添加文章表和标签表的中间表数据
	 * 
	 * @param uId
	 * @param aId
	 * @param tId
	 * @return
	 */
	public int addNewInnerTag(int dId, String[] tId) {
		if (tId==null) {
			return 0;
		}
		String sql = "insert into article_tag_inner(a_id,t_id) values(?,?) ";
		for (int i = 0; i < tId.length; i++) {
			int strToInt = Integer.parseInt(tId[i]);
			updateExecuted(sql, new ParamSet(dId, strToInt));
		}
		return tId.length;
	}

	/**
	 * 通过id查询草稿
	 * 
	 * @param id
	 * @return
	 */
	public DraftDetail getDraftById(int id) {
		String sql = "select id,title,content,cate_id from article where id = ?";
		return query(sql, new ParamSet(id), draftDetail);
	}

	/**
	 * 获取用户选中的标签
	 * 
	 * @param id
	 * @return
	 */
	public List<String> getChooseTag(int id) {
		String sql = "select tag.id from article_tag_inner\r\n" + "left join tag on article_tag_inner.t_id = tag.id\r\n"
				+ "where article_tag_inner.a_id = ? ";
		return queryList(sql, new ParamSet(id), str);
	}

	/**
	 * 所有草稿的数据集
	 * 
	 * @author cier
	 *
	 */
	private class DraftDatas implements RowDatas<Draft> {

		@Override
		public Draft getRowData(ResultSet rs) throws SQLException {
			Draft draft = new Draft();
			draft.setId(rs.getInt(1));
			draft.setName(rs.getString(2));
			draft.setTitle(rs.getString(3));
			draft.setCate(rs.getString(4));
			draft.setDate(rs.getString(5));
			draft.setcNum(rs.getInt(6));
			return draft;
		}
	}

	/**
	 * 所有草稿的数据集
	 * 
	 * @author cier
	 *
	 */
	private class DraftDetailDatas implements RowDatas<DraftDetail> {

		@Override
		public DraftDetail getRowData(ResultSet rs) throws SQLException {
			DraftDetail draft = new DraftDetail();
			draft.setId(rs.getInt(1));
			draft.setTitle(rs.getString(2));
			draft.setContent(rs.getString(3));
			draft.setCateId(rs.getInt(4));
			return draft;
		}
	}

	/**
	 * 返回一个整数
	 * 
	 * @author cier
	 *
	 */
	private class InteDatas implements RowDatas<Integer> {
		@Override
		public Integer getRowData(ResultSet rs) throws SQLException {
			return rs.getInt(1);
		}
	}

	/**
	 * 返回一个字符串
	 * 
	 * @author cier
	 *
	 */
	private class StringDatas implements RowDatas<String> {

		@Override
		public String getRowData(ResultSet rs) throws SQLException {
			return rs.getString(1);
		}
	}
}
