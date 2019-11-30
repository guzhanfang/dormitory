package com.gzf.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.gzf.bean.Dormbean;

public interface IDormDao {
	public boolean addDorm(Dormbean dormbean) ;//增加宿舍
	public boolean delDorm(Dormbean dormbean)  throws SQLException;//删除宿舍
	public boolean updateDorm(Dormbean dormbean) ;//更新宿舍
	public ArrayList<Dormbean> selectDorm(Dormbean dormbean) throws SQLException ;//查询复合条件的宿舍
	public ArrayList<Dormbean> showAllDorm() throws SQLException;//展示所有宿舍
	public boolean isExitDorm(Dormbean dormbean) throws SQLException;//判断宿舍是否存在
	public Dormbean selectDormById(int id) throws SQLException ;//根据宿舍编号查询宿舍并返回宿舍信息
	public int dormTotalCount(Dormbean dormbean) ;//返回宿舍总数
	public boolean updateDormQuantity(int id,int quantity) ;//根据宿舍id更新宿舍学生数，插入学生时使用
	public Dormbean selectDormByDormbean(Dormbean dormbean) throws SQLException; //根据条件返回宿舍
}
