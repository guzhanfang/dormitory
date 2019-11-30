package com.gzf.dao;

import java.sql.SQLException;

import com.gzf.bean.UserBean;

public interface IUserDao {
	public boolean isUserExist(String username, String password) throws SQLException;//登录时根据用户名和密码判断用户是否存在
	public boolean addUser(UserBean userBean);//增加用户
	public boolean updateUser(UserBean userBean);//更新用户信息
	public boolean selectByUserName(String username) throws SQLException;//注册用户时，先根据用户名查找此用户名是否已被注册
	public UserBean selectUser(String username, String password);//根据用户名和密码，返回用户的详细信息
}
