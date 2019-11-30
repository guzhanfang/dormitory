package com.gzf.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.gzf.bean.Dormbean;
import com.gzf.dao.IDormDao;
import com.gzf.util.DButil;
public class DormDAoImpl implements IDormDao {
	
	
	@Override
	public boolean addDorm(Dormbean dormbean) {
		// TODO Auto-generated method stub
		String sql = "INSERT INTO `dorm`( `house`, `build`, `number`, `attribute`, `status`) VALUES (?,?,?,?,?)";
		
		if (dormbean.getHouse().equals("07")||dormbean.getHouse().equals("08")||dormbean.getHouse().equals("09")||dormbean.getHouse().equals("10")) {
			dormbean.setAttribute("女");
		}
		else {
			dormbean.setAttribute("男");
		}
		Object [] params = {dormbean.getHouse(),dormbean.getBuild(),dormbean.getNumber(),dormbean.getAttribute(),dormbean.getStatus()};
		
		return DButil.update(sql, params);
	}

	@Override
	public boolean delDorm(Dormbean dormbean) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "DELETE FROM `dorm` WHERE id = ?";
		Object [] params = {dormbean.getId()}; 
		return DButil.update(sql, params);
	}

	@Override
	public boolean updateDorm(Dormbean dormbean) {
		// TODO Auto-generated method stub
		if (dormbean.getHouse()=="") {
			String sql = "UPDATE `dorm` SET `status`=? WHERE id= ?";
			Object [] params = {dormbean.getStatus(),dormbean.getId()};
			return DButil.update(sql, params);
		}
		else {
			String sql = "UPDATE `dorm` SET `attribute`=?  WHERE id= ?";
			
			Object [] params = {dormbean.getAttribute(),dormbean.getId()};
			System.out.println("正在更改宿舍性别");
			return DButil.update(sql, params);
		}
		
	}

	@Override
	public ArrayList<Dormbean> selectDorm(Dormbean dormbean) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM `dorm` WHERE 1";
		
		if (dormbean.getHouse()=="") {
			sql = sql + " and house != ?";
		}
		else {
			sql = sql + " and house = ?";
		}
		if (dormbean.getBuild()=="") {
			sql = sql + " and build != ?";
		}
		else {
			sql = sql + " and build = ?";
		}
		if (dormbean.getNumber()=="") {
			sql = sql + " and number != ?";
		}
		else {
			sql = sql + " and number = ?";
		}
		if (dormbean.getAttribute()=="") {
			sql = sql + " and attribute != ?";
		}
		else {
			sql = sql + " and attribute = ?";
		}
		if (dormbean.getQuantity()==-1) {
			sql = sql + " and quantity != ?";
		}
		else {
			sql = sql + " and quantity = ?";
		}
		System.out.println(sql);
		Object [] params = {dormbean.getHouse(),dormbean.getBuild(),dormbean.getNumber(),dormbean.getAttribute(),dormbean.getQuantity()};
		
		ResultSet resultSet = DButil.select(sql, params);
		ArrayList<Dormbean> Dormbeans = new ArrayList<>();
		while (resultSet.next()) {
			Dormbean dormbean2 = new Dormbean();
			dormbean2.setId(resultSet.getInt("id"));
			dormbean2.setHouse(resultSet.getString("house"));
			dormbean2.setBuild(resultSet.getString("build"));
			dormbean2.setNumber(resultSet.getString("number"));
			dormbean2.setQuantity(resultSet.getInt("quantity"));
			dormbean2.setAttribute(resultSet.getString("attribute"));
			dormbean2.setStatus(resultSet.getInt("status"));
			Dormbeans.add(dormbean2);
			System.out.println("***"+dormbean2);
		}
		DButil.closeAll();
		return Dormbeans;
	}

	@Override
	public ArrayList<Dormbean> showAllDorm() throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from dorm";
		Object [] params= null;
		ResultSet resultSet = DButil.select(sql, params);
		ArrayList<Dormbean> Dormbeans = new ArrayList<>();
		while (resultSet.next()) {
			Dormbean dormbean2 = new Dormbean();
			dormbean2.setId(resultSet.getInt("id"));
			dormbean2.setHouse(resultSet.getString("house"));
			dormbean2.setBuild(resultSet.getString("build"));
			dormbean2.setNumber(resultSet.getString("number"));
			dormbean2.setQuantity(resultSet.getInt("quantity"));
			dormbean2.setStatus(resultSet.getInt("status"));
			dormbean2.setAttribute(resultSet.getString("attribute"));
			Dormbeans.add(dormbean2);
		}
		try {
			if (resultSet!=null) {
				resultSet.close();
			}	
		} catch (Exception e) {
			// TODO: handle exception
			e.getStackTrace();
		}
		return Dormbeans;
	}

	@Override
	public boolean isExitDorm(Dormbean dormbean) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM `dorm` WHERE house=? and build=? and number=?";
		Object [] params = {dormbean.getHouse(),dormbean.getBuild(),dormbean.getNumber()}; 
		return DButil.isExist(sql, params);
	}

	@Override
	public Dormbean selectDormById(int id) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from dorm where id = ?";
		Object [] params= {id};
		ResultSet resultSet = DButil.select(sql, params);
		Dormbean dormbean = new Dormbean();
		while (resultSet.next()) {
			dormbean.setId(resultSet.getInt("id"));
			dormbean.setHouse(resultSet.getString("house"));
			dormbean.setBuild(resultSet.getString("build"));
			dormbean.setNumber(resultSet.getString("number"));
			dormbean.setQuantity(resultSet.getInt("quantity"));
			dormbean.setStatus(resultSet.getInt("status"));
			dormbean.setAttribute(resultSet.getString("attribute"));
		}
		try {
			if (resultSet!=null) {
				resultSet.close();
			}	
		} catch (Exception e) {
			// TODO: handle exception
			e.getStackTrace();
		}
		return dormbean;
	}

	@Override
	public int dormTotalCount(Dormbean dormbean) {
		// TODO Auto-generated method stub
		String sql = "select count(1) FROM `dorm` WHERE 1";
		
		if (dormbean.getHouse()=="") {
			sql = sql + " and house != ?";
		}
		else {
			sql = sql + " and house = ?";
		}
		if (dormbean.getBuild()=="") {
			sql = sql + " and build != ?";
		}
		else {
			sql = sql + " and build = ?";
		}
		if (dormbean.getNumber()=="") {
			sql = sql + " and number != ?";
		}
		else {
			sql = sql + " and number = ?";
		}
		if (dormbean.getAttribute()=="") {
			sql = sql + " and attribute != ?";
		}
		else {
			sql = sql + " and attribute = ?";
		}
		if (dormbean.getQuantity()==-1) {
			sql = sql + " and quantity != ?";
		}
		else {
			sql = sql + " and quantity = ?";
		}
		
		Object [] params = {dormbean.getHouse(),dormbean.getBuild(),dormbean.getNumber(),dormbean.getAttribute(),dormbean.getQuantity()};
		
		
		return DButil.totalCount(sql, params);
	}

	@Override
	public boolean updateDormQuantity(int id,int quantity) {
		// TODO Auto-generated method stub
		String sql = "UPDATE  `dormitory`.`dorm` SET  `quantity` =  ? WHERE  `dorm`.`id` =?;";
		Object [] params = {quantity,id};
		return DButil.update(sql, params);
	}

	@Override
	public Dormbean selectDormByDormbean(Dormbean dormbean) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM `dorm` WHERE house=? and build=? and number=?";
		Object [] params = {dormbean.getHouse(),dormbean.getBuild(),dormbean.getNumber()}; 
		ResultSet resultSet = DButil.select(sql, params);
		Dormbean dormbean1 = new Dormbean();
		while (resultSet.next()) {
			dormbean1.setId(resultSet.getInt("id"));
			dormbean1.setHouse(resultSet.getString("house"));
			dormbean1.setBuild(resultSet.getString("build"));
			dormbean1.setNumber(resultSet.getString("number"));
			dormbean1.setQuantity(resultSet.getInt("quantity"));
			dormbean1.setStatus(resultSet.getInt("status"));
			dormbean1.setAttribute(resultSet.getString("attribute"));
		}
		try {
			if (resultSet!=null) {
				resultSet.close();
			}	
		} catch (Exception e) {
			// TODO: handle exception
			e.getStackTrace();
		}
		return dormbean1;
	}

	

}
