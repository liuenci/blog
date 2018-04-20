package com.blog.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import com.blog.dao.conn.DataManager;
import com.blog.dao.conn.ParamSet;
import com.blog.dao.conn.RowDatas;
import com.blog.pojo.Comment;
import com.blog.util.DateUtil;

public class CommentDao extends DataManager {
	private RowDatas<Comment> commentDatas;
	public CommentDao() {
		commentDatas = new CommentDatas();
	}
	/**
	 * 游客评论
	 * @param content
	 * @param aId
	 * @return
	 */
	public int addNewCommentByVisitor(String content,int aId) {
		String date = DateUtil.NowDate(new Date());
		String sql = "insert into discuss(content,a_id,date)values(?,?,?)";
		return updateExecuted(sql,new ParamSet(content,aId,date));
	}
	/**
	 * 博主评论
	 * @param content
	 * @param aId
	 * @param uId
	 * @return
	 */
	public int addNewCommentBy(String content,int aId,int uId) {
		String date = DateUtil.NowDate(new Date());
		String sql = "insert into discuss(content,a_id,u_id,date)values(?,?,?,?)";
		return updateExecuted(sql,new ParamSet(content,aId,uId,date));
	}
	/**
	 * 获取某篇文章下的所有评论
	 * @param id
	 * @return
	 */
	public List<Comment> getAllCommentByArticleId(int id){
		String sql = "select `user`.name , discuss.content,discuss.date from discuss\r\n" + 
				"left join user on discuss.u_id = `user`.id\r\n" + 
				"where discuss.a_id = ? order by discuss.date desc";
		return queryList(sql,new ParamSet(id),commentDatas);
	}
	/**
	 * 获取评论的数据集
	 * @author cier
	 */
	private class CommentDatas implements RowDatas<Comment> {
		@Override
		public Comment getRowData(ResultSet rs) throws SQLException {
			Comment comment = new Comment();
			comment.setName(rs.getString(1));
			comment.setContent(rs.getString(2));
			comment.setDate(rs.getString(3));
			return comment;
		}
	}
}
