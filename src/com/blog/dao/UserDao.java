package com.blog.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.blog.dao.conn.DataManager;
import com.blog.dao.conn.ParamSet;
import com.blog.dao.conn.RowDatas;
import com.blog.pojo.User;

/**
 * 用户dao
 * 
 * @author cier
 *
 */
public class UserDao extends DataManager {
	private RowDatas<User> user;
	private RowDatas<Integer> inte;
	private RowDatas<User> userInfo;

	public UserDao() {
		user = new UserDatas();
		inte = new InteDatas();
		userInfo = new UpdateUserDatas();
	}
	/**
	 * 管理员登陆
	 * @param name
	 * @param password
	 * @return
	 */
	public int isManager(String name,String password) {
		String sql = "select count(*) from user where name = ? and password = ? and status = 0";
		return query(sql,new ParamSet(name,password),inte);
	}
	/**
	 * 更新用户密码
	 * @param id
	 * @param password
	 * @return
	 */
	public int updatePassword(int id,String password) {
		String sql = "update user set password = ? where id = ?";
		return updateExecuted(sql,new ParamSet(password,id));
	}
	/**
	 * 检查用户是否存在
	 * 
	 * @param username
	 * @return
	 */
	public int checkUserName(String username) {
		String sql = "select count(1) from user where name = ? and status = 1";
		return query(sql, new ParamSet(username), inte);
	}

	/**
	 * 根据姓名查找ID
	 * 
	 * @param name
	 * @return
	 */
	public int searchId(String name) {
		String sql = "select id from user where name = ? and status = 1";
		return query(sql, new ParamSet(name), inte);
	}

	/**
	 * 更新用户资料
	 * 
	 * @param username
	 * @param phone
	 * @param email
	 * @param explanation
	 * @param id
	 * @return
	 */
	public int updateUserMane(String phone, String email, String explanation, int id) {
		String sql = "update  user set phone=? , email=? , description=?  where id=? ";
		return updateExecuted(sql, new ParamSet(phone, email, explanation, id));
	}

	/**
	 * 检查用户账号密码是否存在
	 * 
	 * @param name
	 * @param password
	 * @return
	 */
	public int checkUserPassword(String name, String password) {
		String sql = "select count(1) from user where name = ? and password = ? and status = 1";
		return query(sql, new ParamSet(name, password), inte);
	}
	/**
	 * 检查手机号是否被注册
	 * @param phone
	 * @return
	 */
	public int checkUserPhone(String phone){
		String sql = "select count(1) from user where phone = ?";
		return query(sql,new ParamSet(phone),inte);
	}
	/**
	 * 检查邮箱是否被注册
	 * @param email
	 * @return
	 */
	public int checkUserEmail(String email) {
		String sql = "select count(1) from user where email = ?";
		return query(sql,new ParamSet(email),inte);
	}
	/**
	 * 添加新用户
	 * 
	 * @param name
	 * @param password
	 * @return
	 */
	public int insertUser(String name, String password,String phone,String email) {
		String sql = "insert into user(name,password,phone,email,status) value(?,?,?,?,1)";
		return updateExecuted(sql, new ParamSet(name, password,phone,email));
	}
	/**
	 * 通过博主id查询博主的部分信息
	 * @param uId
	 * @return
	 */
	public User getUserInformationById(int uId) {
		String sql = "select name,phone,email,description from user where id = ?";
		return query(sql,new ParamSet(uId),userInfo);
	}
	/**
	 * 获取博主信息数据集
	 * @author cier
	 */
	public class UserDatas implements RowDatas<User> {

		@Override
		public User getRowData(ResultSet rs) throws SQLException {
			User user = new User();
			user.setId(rs.getInt(1));
			user.setName(rs.getString(2));
			user.setPhone(rs.getString(3));
			user.setEmail(rs.getString(4));
			user.setDescription(rs.getString(5));
			user.setStatus(rs.getShort(6));
			return user;
		}
	}
	/**
	 * 获取一个整数
	 * @author cier
	 */
	public class InteDatas implements RowDatas<Integer> {

		@Override
		public Integer getRowData(ResultSet rs) throws SQLException {
			return rs.getInt(1);
		}
	}
	/**
	 * 用户中心更新数据
	 * @author cier
	 */
	public class UpdateUserDatas implements RowDatas<User>{
		@Override
		public User getRowData(ResultSet rs) throws SQLException {
			User user = new User();
			user.setName(rs.getString(1));
			user.setPhone(rs.getString(2));
			user.setEmail(rs.getString(3));
			user.setDescription(rs.getString(4));
			return user;
		}
	}
}
