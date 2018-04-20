package com.blog.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.List;

import com.blog.dao.conn.DataManager;
import com.blog.dao.conn.ParamSet;
import com.blog.dao.conn.RowDatas;
import com.blog.pojo.AllArticle;
import com.blog.pojo.Article;
import com.blog.pojo.ArticleDetail;
import com.blog.pojo.ArticleOutline;
import com.blog.pojo.ArticleTag;
import com.blog.pojo.BackArticle;
import com.blog.pojo.CateNum;
import com.blog.pojo.Categories;
import com.blog.pojo.Discuss;
import com.blog.pojo.Draft;
import com.blog.pojo.MonthNum;
import com.blog.pojo.Tag;
import com.blog.pojo.TagNum;
import com.blog.pojo.User;
import com.blog.pojo.UserMainArticle;

public class ArticleDao extends DataManager {
	private RowDatas<Tag> tag;
	private RowDatas<Integer> inte;
	private RowDatas<Article> article;
	private RowDatas<TagNum> tagNum;
	private RowDatas<String> str;
	private RowDatas<CateNum> cateCount;
	private RowDatas<MonthNum> monthNum;
	private RowDatas<UserMainArticle> userMainArticle;
	private RowDatas<ArticleDetail> articleDetail;
	private RowDatas<ArticleTag> articleTag;
	private RowDatas<Discuss> dis;
	private RowDatas<AllArticle> allarticle;
	private RowDatas<User> user;
	private RowDatas<BackArticle> backArticle;
	private RowDatas<Categories> cate;
	private RowDatas<ArticleOutline> articleOutline;

	public ArticleDao() {
		inte = new InteDatas();
		article = new ArticleDatas();
		tagNum = new DyTagDatas();
		str = new StringDatas();
		cateCount = new CateNumRows();
		monthNum = new YearMonthNumDatas();
		userMainArticle = new UserMainArticleDatas();
		articleDetail = new ArticleDetailDatas();
		articleTag = new ArticleTagDatas();
		dis = new DiscussDatas();
		allarticle = new AllArticleDatas();
		user = new UserDatas();
		backArticle = new BackArticleDatas();
		cate = new CategoriesDatas();
		articleOutline = new ArticleOutlineDatas();
	}
	/**
	 * 通过文章名找文章
	 * @param title
	 * @return
	 */
	public List<AllArticle> searchArticle(int id,String title){
		String sql = "select article.id,title,`user`.name,categories.`name`,count(discuss.content),article.date,c_num from `user`\r\n" + 
				"left JOIN article on article.u_id = `user`.id\r\n" + 
				"LEFT JOIN categories on categories.id = article.cate_id\r\n" + 
				"left JOIN discuss on discuss.a_id = article.id\r\n" + 
				"where article.u_id = ? and article.status = 1 and concat(title,categories.`name`,article.date) like ? \r\n" + 
				"GROUP BY article.id\r\n" + 
				"order by article.date desc";
				return queryList(sql,new ParamSet(id,"%"+title+"%"),allarticle);
	}
	/**
	 * 获取数据库所有的文章概要
	 * @return
	 */
	public List<ArticleOutline> getAllArticle(){
		String sql = "select article.id,title,`user`.name,article.date,categories.`name`,count(discuss.content),c_num from `user`\r\n" + 
				"left JOIN article on article.u_id = `user`.id\r\n" + 
				"LEFT JOIN categories on categories.id = article.cate_id\r\n" + 
				"left JOIN discuss on discuss.a_id = article.id\r\n" + 
				"where article.status = 1\r\n" + 
				"GROUP BY article.id\r\n" + 
				"order by article.date desc";
		return queryList(sql,articleOutline);
	}
	/**
	 * 更新阅读数
	 * @param id
	 * @return
	 */
	public int updateReadNum(int id) {
		String sql = "update article set c_num = c_num + 1 where id = ?";
		return updateExecuted(sql,new ParamSet(id));
	}
	/**
	 * 删除评论
	 * 
	 * @param id
	 * @return
	 */
	public int deleteDiscussById(int id) {
		String sql = "delete from discuss where id = ?";
		return updateExecuted(sql, new ParamSet(id));
	}

	/**
	 * 通过文章id删除文章
	 * 
	 * @param id
	 * @return
	 */
	public int deleteArticleById(int id) {
		String sql = "update article set status = 0 where id = ?";
		return updateExecuted(sql, new ParamSet(id));
	}

	/**
	 * 删除文章关联的标签
	 * 
	 * @param id
	 * @return
	 */
	public int deleteArticleInner(int id) {
		String sql = "delete from article_tag_inner where a_id = ?";
		return updateExecuted(sql, new ParamSet(id));
	}

	/**
	 * 根据用户id查找日期和标题
	 * 
	 * @param uId
	 * @return
	 */
	public List<Article> getFiling(int uId) {
		String sql = "select date,title from article where u_id = ?";
		return queryList(sql, new ParamSet(uId), article);
	}

	/**
	 * 根据ID删除对应行标签
	 * 
	 * @param id
	 * @return
	 */
	public int deleteTag(int uId, int tId) {
		String sql = "delete from user_tag_inner where u_id=? and t_id = ?";
		return updateExecuted(sql, new ParamSet(uId, tId));
	}

	/**
	 * 根据用户 name 查询用户 id
	 * 
	 * @param name
	 * @return
	 */
	public int getUserIdByName(String name) {
		String sql = "select id from user where name = ?";
		return query(sql, new ParamSet(name), inte);
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
	public int addNewArticle(String title, int cate_id, String content, int u_id) {
		// 获取当前时间
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(new java.util.Date());
		String sql = "insert into article(title,cate_id,content,date,c_num,u_id)value(?,?,?,?,0,?)";
		return updateExecuted(sql, new ParamSet(title, cate_id, content, date, u_id));
	}

	/**
	 * 添加文章表和标签表的中间表数据
	 * 
	 * @param uId
	 * @param aId
	 * @param tId
	 * @return
	 */
	public int addNewInnerTag(int aId, String[] tId) {
		if (tId==null) {
			return 0;
		}
		String sql = "insert into article_tag_inner(a_id,t_id) values(?,?) ";
		for (int i = 0; i < tId.length; i++) {
			int strToInt = Integer.parseInt(tId[i]);
			updateExecuted(sql, new ParamSet(aId, strToInt));
		}
		return tId.length;
	}

	/**
	 * 通过标题查询文章的id
	 * 
	 * @param title
	 * @return
	 */
	public int getArticleIdByTitle(String title) {
		String sql = "select id from article where title = ?";
		return query(sql, new ParamSet(title), inte);
	}

	/**
	 * 根据用户的 id 查询所有的文章
	 * 
	 * @param id
	 * @return
	 */
	public List<UserMainArticle> getAllArticleByUserId(int id) {
		String sql = "select article.id,title,left(article.content,250),article.date,c_num,count(discuss.content) from article\r\n" + 
				"LEFT JOIN categories on categories.id = article.cate_id\r\n" + 
				"left JOIN discuss on discuss.a_id = article.id\r\n" + 
				"where article.u_id = ? and status = 1\r\n" + 
				"GROUP BY article.id\r\n" + 
				"order by article.date desc";
		return queryList(sql, new ParamSet(id), userMainArticle);
	}

	/**
	 * 根据用户Id 查询所有文章的概述
	 * 
	 * @param id
	 * @return
	 */
	public List<AllArticle> getAllArticleOverview(int id) {
		String sql = "select article.id,title,`user`.name,categories.`name`,count(discuss.content),article.date,c_num from `user`\r\n" + 
				"left JOIN article on article.u_id = `user`.id\r\n" + 
				"LEFT JOIN categories on categories.id = article.cate_id\r\n" + 
				"left JOIN discuss on discuss.a_id = article.id\r\n" + 
				"where article.u_id = ? and article.status = 1\r\n" + 
				"GROUP BY article.id\r\n" + 
				"order by article.date desc;";
		return queryList(sql, new ParamSet(id), allarticle);
	}

	/**
	 * 得到用户所有信息
	 * 
	 * @return
	 */
	public List<User> getAllMaterial() {
		String sql = "SELECT `user`.id,`user`.`name`,`user`.phone,`user`.email,`user`.description,`user`.`status` "
				+ "FROM `user` WHERE `user`.`status` <> 0";
		return queryList(sql, user);
	}

	/**
	 * 得到所有文章
	 * 
	 * @return
	 */
	public List<BackArticle> getBackArticle() {
		String sql = "SELECT article.id,article.title, "
				+ " (select count(*) from discuss where discuss.a_id=article.id), "
				+ " (SELECT categories.`name`FROM categories WHERE categories.id = article.cate_id), "
				+ " article.date,article.c_num, "
				+ " (SELECT `user`.`name` FROM `user` WHERE `user`.id = article.u_id) "
				+ "  FROM article WHERE article.`status` = 1";
		return queryList(sql, backArticle);
	}

	/**
	 * 得到所有分类
	 * 
	 * @return
	 */
	public List<Categories> getCategories() {
		String sql = "SELECT categories.id,categories.`name`FROM categories";
		return queryList(sql, cate);
	}

	/**
	 * 计算博主所有文章数目
	 * 
	 * @param id
	 * @return
	 */
	public int getArticleNumber(int id) {
		String sql = "SELECT COUNT( article.title) as allart FROM `user` "
				+ " left JOIN article on article.u_id = `user`.id " + " WHERE `user`.id = ? " + "  GROUP BY `user`.id";
		return query(sql, new ParamSet(id), inte);
	}

	/**
	 * 计算博主所有文章的所有评论
	 * 
	 * @param id
	 * @return
	 */
	public int getAllDiscussNumber(int id) {
		String sql = "SELECT COUNT(discuss.content) as alldis FROM `user` "
				+ " LEFT JOIN article on article.u_id = `user`.id " + " LEFT JOIN discuss on discuss.a_id = article.id "
				+ " WHERE `user`.id = ? " + " GROUP BY `user`.id";
		return query(sql, new ParamSet(id), inte);
	}

	/**
	 * 博主首页的标签展示
	 * 
	 * @param uId
	 * @return
	 */
	public List<TagNum> getUserTagForPortal(int uId) {
		return null;
	}

	/**
	 * 通过博主的Id查询所有的文章的所有评论
	 * 
	 * @param uId
	 * @return
	 */
	public List<Discuss> getAllDiscussById(int uId) {
		String sql = "select discuss.id,discuss.content,title,user.name,discuss.date from discuss "
				+ " left join article on article.id = discuss.a_id " + " LEFT JOIN user on `user`.id = discuss.u_id "
				+ " where discuss.a_id in (select id from article where article.u_id = ?) "
				+ " and discuss.u_id in (select id from user) ";
		return queryList(sql, new ParamSet(uId), dis);
	}

	/**
	 * 获取用户所有的分类以及每种分类的文章篇数
	 * 
	 * @return
	 */
	public List<CateNum> getAllCate(int id) {
		String sql = "select categories.name,COUNT(1) from article  "
				+ " LEFT JOIN categories on categories.id = article.cate_id " + " where u_id = ? and status = 1 GROUP BY cate_id";
		return queryList(sql, new ParamSet(id), cateCount);
	}

	/**
	 * 按月份查询文章的篇数
	 * 
	 * @param id
	 * @return
	 */
	public List<MonthNum> getMonthAndNum(int id) {
		String sql = "select DATE_FORMAT(date,\"%y年%m月\") as datetime,count(1) num from article where u_id = ? and status = 1 group BY datetime ;";
		return queryList(sql, new ParamSet(id), monthNum);
	}

	/**
	 * 根据id查询文章的详情
	 * 
	 * @param id
	 * @return
	 */
	public ArticleDetail getArticleDetailById(int id) {
		String sql = "select article.id,title,article.date,categories.`name` as cate,article.c_num,count(discuss.content),article.content "
				+ " from article " + " LEFT join categories on article.cate_id = categories.id "
				+ " left JOIN discuss on article.id = discuss.a_id " + " where article.id = ? "
				+ " GROUP BY article.id";
		return query(sql, new ParamSet(id), articleDetail);
	}

	/**
	 * 根据文章 id 查询这篇文章的所有标签
	 * 
	 * @param aId
	 * @return
	 */
	public List<ArticleTag> getArticleTagById(int aId) {
		String sql = "select tag.id,tag.name ,article_tag_inner.a_id from article_tag_inner\r\n"
				+ "left join tag on article_tag_inner.t_id = tag.id\r\n" + "where article_tag_inner.a_id = ?";
		return queryList(sql, new ParamSet(aId), articleTag);
	}

	/**
	 * 文章分类及文章篇数的数据集
	 * 
	 * @author cier
	 *
	 */
	private class CateNumRows implements RowDatas<CateNum> {

		@Override
		public CateNum getRowData(ResultSet rs) throws SQLException {
			CateNum cateNum = new CateNum();
			cateNum.setName(rs.getString(1));
			cateNum.setNum(rs.getInt(2));
			return cateNum;
		}

	}

	private class InteDatas implements RowDatas<Integer> {
		@Override
		public Integer getRowData(ResultSet rs) throws SQLException {
			return rs.getInt(1);
		}
	}

	/**
	 * 所有文章的数据集
	 * 
	 * @author lenovo
	 *
	 */
	private class ArticleDatas implements RowDatas<Article> {

		@Override
		public Article getRowData(ResultSet rs) throws SQLException {
			Article article = new Article();
			article.setId(rs.getInt(1));
			article.setTitle(rs.getString(2));
			article.setCate(rs.getString(3));
			article.setContent(rs.getString(4));
			article.setDate(rs.getString(5));
			article.setcNum(rs.getInt(6));
			article.setuId(rs.getInt(7));
			return article;
		}
	}

	/**
	 * 文章所有信息
	 * 
	 * @author lenovo
	 *
	 */
	private class BackArticleDatas implements RowDatas<BackArticle> {
		@Override
		public com.blog.pojo.BackArticle getRowData(ResultSet rs) throws SQLException {
			BackArticle backArticle = new BackArticle();
			backArticle.setId(rs.getInt(1));
			backArticle.setTitle(rs.getString(2));
			backArticle.setDiscuss(rs.getInt(3));
			backArticle.setCategories(rs.getString(4));
			backArticle.setDate(rs.getString(5));
			backArticle.setViews(rs.getInt(6));
			backArticle.setName(rs.getString(7));
			return backArticle;
		}

	}

	private class CategoriesDatas implements RowDatas<Categories> {
		@Override
		public Categories getRowData(ResultSet rs) throws SQLException {
			Categories cate = new Categories();
			cate.setId(rs.getInt(1));
			cate.setName(rs.getString(2));
			return cate;
		}
	}

	/**
	 * 用户所有信息的数据集
	 * 
	 * @author lenovo
	 *
	 */
	private class UserDatas implements RowDatas<User> {
		@Override
		public User getRowData(ResultSet rs) throws SQLException {
			User user = new User();
			user.setId(rs.getInt(1));
			user.setName(rs.getString(2));
			user.setPhone(rs.getString(3));
			user.setEmail(rs.getString(4));
			user.setDescription(rs.getString(5));
			user.setStatus(rs.getInt(6));
			return user;
		}
	}

	/**
	 * 个人中心的评论数据集
	 * 
	 * @author lenovo
	 *
	 */
	private class DiscussDatas implements RowDatas<Discuss> {
		@Override
		public Discuss getRowData(ResultSet rs) throws SQLException {
			Discuss dis = new Discuss();
			dis.setId(rs.getInt(1));
			dis.setContent(rs.getString(2));
			dis.setTitle(rs.getString(3));
			dis.setName(rs.getString(4));
			dis.setDate(rs.getString(5));
			return dis;
		}
	}

	private class AllArticleDatas implements RowDatas<AllArticle> {
		@Override
		public AllArticle getRowData(ResultSet rs) throws SQLException {
			AllArticle allarticle = new AllArticle();
			allarticle.setId(rs.getInt(1));
			allarticle.setTitle(rs.getString(2));
			allarticle.setName(rs.getString(3));
			allarticle.setDirectory(rs.getString(4));
			allarticle.setDiscusses(rs.getInt(5));
			allarticle.setDate(rs.getString(6));
			allarticle.setViews(rs.getInt(7));
			return allarticle;
		}
	}

	/**
	 * 自定义tag类，用于博主首页展示
	 * 
	 * @author cier
	 *
	 */
	private class DyTagDatas implements RowDatas<TagNum> {

		@Override
		public TagNum getRowData(ResultSet rs) throws SQLException {
			TagNum tagNum = new TagNum();
			tagNum.setName(rs.getString(1));
			tagNum.setNum(rs.getInt(2));
			tagNum.setuId(rs.getInt(3));
			return tagNum;
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

	/**
	 * 返回月份以及每月发文的篇数
	 * 
	 * @author cier
	 *
	 */
	private class YearMonthNumDatas implements RowDatas<MonthNum> {

		@Override
		public MonthNum getRowData(ResultSet rs) throws SQLException {
			MonthNum monthNum = new MonthNum();
			monthNum.setMonth(rs.getString(1));
			monthNum.setNum(rs.getInt(2));
			return monthNum;
		}

	}

	/**
	 * 返回用户首页中需要显示的文章部分
	 * 
	 * @author cier
	 *
	 */
	private class UserMainArticleDatas implements RowDatas<UserMainArticle> {

		@Override
		public UserMainArticle getRowData(ResultSet rs) throws SQLException {
			UserMainArticle userMainArticle = new UserMainArticle();
			userMainArticle.setId(rs.getInt(1));
			userMainArticle.setTitle(rs.getString(2));
			userMainArticle.setContent(rs.getString(3));
			userMainArticle.setDate(rs.getString(4));
			userMainArticle.setcNum(rs.getInt(5));
			userMainArticle.setdNum(rs.getInt(6));
			return userMainArticle;
		}
	}

	/**
	 * 文章详情数据集
	 * 
	 * @author cier
	 *
	 */
	private class ArticleDetailDatas implements RowDatas<ArticleDetail> {

		@Override
		public ArticleDetail getRowData(ResultSet rs) throws SQLException {
			ArticleDetail articleDetail = new ArticleDetail();
			articleDetail.setId(rs.getInt(1));
			articleDetail.setTitle(rs.getString(2));
			articleDetail.setDate(rs.getString(3));
			articleDetail.setCate(rs.getString(4));
			articleDetail.setReadNum(rs.getInt(5));
			articleDetail.setCommentNum(rs.getInt(6));
			articleDetail.setContent(rs.getString(7));
			return articleDetail;
		}
	}

	/**
	 * 文章细节的所有标签数据集
	 * 
	 * @author cier
	 *
	 */
	private class ArticleTagDatas implements RowDatas<ArticleTag> {

		@Override
		public ArticleTag getRowData(ResultSet rs) throws SQLException {
			ArticleTag articleTag = new ArticleTag();
			articleTag.setId(rs.getInt(1));
			articleTag.setName(rs.getString(2));
			articleTag.setaId(rs.getInt(3));
			return articleTag;
		}
	}
	/**
	 * 博客首页的展示文章
	 * @author cier
	 *
	 */
	private class ArticleOutlineDatas implements RowDatas<ArticleOutline> {

		@Override
		public ArticleOutline getRowData(ResultSet rs) throws SQLException {
			ArticleOutline article = new ArticleOutline();
			article.setId(rs.getInt(1));
			article.setTitle(rs.getString(2));
			article.setName(rs.getString(3));
			article.setDate(rs.getString(4));
			article.setCate(rs.getString(5));
			article.setCommentNum(rs.getInt(6));
			article.setReadNum(rs.getInt(7));
			return article;
		}
	}

}
