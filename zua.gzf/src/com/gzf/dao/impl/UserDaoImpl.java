package com.gzf.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.gzf.bean.UserBean;
import com.gzf.dao.IUserDao;
import com.gzf.util.DButil;

public class UserDaoImpl implements IUserDao{

	@Override
	public boolean isUserExist(String username, String password) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from user where username = ? AND password = ?;";
		Object [] params = {username,password};
		return DButil.isExist(sql, params);
	}

	@Override
	public boolean addUser(UserBean userBean) {
		// TODO Auto-generated method stub
		String sql = "insert into user (username,password,email)\r\n" + 
				"values(?,?,?)";
		Object [] params = {userBean.getUsername(),userBean.getPassword(),userBean.getEmail()};
		return DButil.update(sql, params);
	}

	@Override
	public boolean updateUser(UserBean userBean) {
		// TODO Auto-generated method stub
		String sql = "update user set password = ?,email = ? where username = ?";
		Object [] params = {userBean.getPassword(),userBean.getEmail(),userBean.getUsername()};
		return DButil.update(sql, params);
	}

	@Override
	public boolean selectByUserName(String username) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from user where username = ?";
		Object [] params = {username};
		return DButil.isExist(sql, params);
	}

	@Override
	public UserBean selectUser(String username, String password) {
		// TODO Auto-generated method stub
		String sql = "select * from user where username = ? AND password = ?;";
		Object [] params = {username,password};
		ResultSet resultSet = DButil.select(sql, params);
		UserBean userBean = new UserBean();
		try {
			if (resultSet.next()) {
				userBean.setUsername(resultSet.getString("username"));
				userBean.setPassword(resultSet.getString("password"));
				userBean.setEmail(resultSet.getString("email"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return userBean;
	}

}
