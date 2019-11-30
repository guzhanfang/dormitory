package com.gzf.service;

import java.sql.SQLException;

import com.gzf.bean.UserBean;

public interface IUserService {
	public boolean login(String username, String password) throws Exception;//登录验证
	public boolean register(UserBean userBean) throws SQLException ;//注册用户
	public boolean addUser(UserBean userBean);//增加用户
}
