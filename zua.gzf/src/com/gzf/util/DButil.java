package com.gzf.util;

import java.sql.SQLException;

public class DButil {
	public static java.sql.Connection connection = null;
	public static java.sql.PreparedStatement preparedStatement = null;
	public static java.sql.ResultSet resultSet =null;
	public static void closeAll() {
		try {
			if (resultSet!=null) {
				resultSet.close();
			}
			if (preparedStatement!=null) {
				preparedStatement.close();
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.getStackTrace();
		}
	}
	public static boolean update(String sql,Object[] params){
		int updateresult = 0;
		try {
			connection = DBConnection.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			if (params!=null) {
				for (int i = 0; i < params.length; i++) {
					preparedStatement.setObject(i+1, params[i]);
				}
			}
			updateresult = preparedStatement.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		closeAll();
		if (updateresult>0) {
			
			return true;
		}
		else {
			
			return false;
		}
		
	}
//	数组为传递过来的参数
	public static java.sql.ResultSet select(String sql,Object[] params) {
		try {
			connection = DBConnection.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			if (params!=null) {
				for (int i = 0; i < params.length; i++) {
					preparedStatement.setObject(i+1, params[i]);
				}
			}
			resultSet = preparedStatement.executeQuery();
		} catch (Exception e) {
			// TODO: handle exception
			e.getStackTrace();
		}
		return resultSet;		
	}
//	是否存在
	public static boolean isExist(String sql,Object[] params) throws SQLException{
		boolean isexist = false;
		try {
			connection = DBConnection.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			if (params!=null) {
				for (int i = 0; i < params.length; i++) {
					preparedStatement.setObject(i+1, params[i]);
				}
			}
			resultSet = preparedStatement.executeQuery();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (resultSet.next()) {
			isexist = true; 
		}
		else {
			isexist = false;
		}
		closeAll();
		return isexist;
		
	}
	public static int totalCount(String sql,Object[] params) {
		int totalCount = 0;
		try {
			connection = DBConnection.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			if (params!=null) {
				for (int i = 0; i < params.length; i++) {
					preparedStatement.setObject(i+1, params[i]);
				}
			}
			resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				totalCount = resultSet.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		closeAll();
		return totalCount;
		
	}
}
