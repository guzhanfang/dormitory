package com.gzf.service.impl;

import java.sql.SQLException;

import com.gzf.bean.UserBean;
import com.gzf.dao.impl.UserDaoImpl;
import com.gzf.service.IUserService;

public class UserServiceImpl implements IUserService {

	@Override
	public boolean login(String username, String password) throws Exception {
		// TODO Auto-generated method stub
		UserDaoImpl userDaoImpl = new UserDaoImpl();
		if (userDaoImpl.isUserExist(username, password)) {
			return true;
		}
		else {
			return false;
		}
		
	}

	@Override
	public boolean register(UserBean userBean) throws SQLException {
		// TODO Auto-generated method stub
		UserDaoImpl userDaoImpl = new UserDaoImpl();
		if (userDaoImpl.selectByUserName(userBean.getUsername())) {
			return false;
		}
		else {
			if (userDaoImpl.addUser(userBean)) {
				return true;
			}
			else {
				return false;
			}
		}
		
		
	}

	public boolean addUser(UserBean userBean) {
		// TODO Auto-generated method stub
		UserDaoImpl userDaoImpl = new UserDaoImpl();
		if (userDaoImpl.addUser(userBean)) {
			return true;
		}
		else {
			return false;
		}
		
	}

}
