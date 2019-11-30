package com.gzf.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.gzf.bean.Dormbean;

public interface IDormService {
	public boolean addDorm(Dormbean dormbean) throws SQLException ;//增加宿舍信息
	public boolean delDorm(Dormbean dormbean) throws SQLException;//删除宿舍信息
	public boolean updateDorm(Dormbean dormbean) throws SQLException ;//更新宿舍信息
	public ArrayList<Dormbean> selectDorm(Dormbean dormbean) throws SQLException ;//查询宿舍信息
	public ArrayList<Dormbean> showAllDorm() throws SQLException;//展示所有宿舍信息
	public int dormTotalCount(Dormbean dormbean);//获取宿舍个数
	public Dormbean selectDormById(int id) throws SQLException;//根据id查询宿舍
	public boolean updateDormQuantity(Dormbean dormbean); //更新宿舍当前人数
}
