package com.blog.service;

import com.blog.dao.UserDao;
import com.blog.pojo.User;

/**
 * 用户的service层
 * @author cier
 *
 */
public class UserService {
	private UserDao userDao;
	
	public UserService() {
		userDao = new UserDao();
	}
	/**
	 * 管理员登陆
	 * @param name
	 * @param password
	 * @return
	 */
	public int isManager(String name,String password) {
		return userDao.isManager(name, password);
	}
	/**
	 * 更新用户密码
	 * @param id
	 * @param password
	 * @return
	 */
	public int updatePassword(int id,String password) {
		return userDao.updatePassword(id, password);
	}
	/**
	 * 检查用户是否存在
	 * @param username
	 * @return
	 */
	public int checkUserName(String username) {
		return userDao.checkUserName(username);
	}
	
	/**
	 * 根据姓名查找ID
	 * @param name
	 * @return
	 */
	public int searchId(String name){
		return userDao.searchId(name);
	}
	
	/**
	 * 更新用户资料
	 * @param username
	 * @param phone
	 * @param email
	 * @param explanation
	 * @param id
	 * @return
	 */
	public int updateUserInformation(String phone,String email,String explanation, int id){
		return userDao.updateUserMane(phone, email, explanation, id);
	}
	/**
	 * 检查用户账号密码是否正确
	 * @param name
	 * @param password
	 * @return
	 */
	public int checkUserPassword(String name,String password) {
		return userDao.checkUserPassword(name, password);
	}
	/**
	 * 添加新用户
	 * @param name
	 * @param password
	 * @return
	 */
	public int insertUser(String name, String password,String phone,String email) {
		return userDao.insertUser(name, password,phone,email);
	}
	/**
	 * 检查用户的手机号是否被注册
	 * @param phone
	 * @return
	 */
	public int checkUserPhone(String phone) {
		return userDao.checkUserPhone(phone);
	}
	/**
	 * 检查用户的邮箱是否被注册
	 * @param email
	 * @return
	 */
	public int checkUserEmail(String email) {
		return userDao.checkUserEmail(email);
	}
	/**
	 * 通过博主Id查询部分信息
	 * @param uId
	 * @return
	 */
	public User getUserInfoById(int uId) {
		return userDao.getUserInformationById(uId);
	}
}
